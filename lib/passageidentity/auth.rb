# frozen_string_literal: true

require 'openssl'
require 'base64'
require 'jwt'
require 'rubygems/deprecate'
require_relative 'client'
require_relative '../openapi_client'

module Passage
  # The Passage::Auth class provides methods for authenticating requests and tokens
  class Auth
    extend Gem::Deprecate

    # rubocop:disable Metrics/AbcSize
    def initialize(app_id, api_key, auth_strategy)
      @app_cache = {}
      @app_id = app_id
      @api_key = api_key
      @auth_strategy = auth_strategy

      fetch_jwks

      header_params = { 'Passage-Version' => "passage-ruby #{Passage::VERSION}" }
      header_params['Authorization'] = "Bearer #{@api_key}" if @api_key != ''

      @req_opts = {}
      @req_opts[:header_params] = header_params
      @req_opts[:debug_auth_names] = ['header']
    end

    def authenticate_request(request)
      # Get the token based on the strategy
      if @auth_strategy == Passage::COOKIE_STRATEGY
        unless request.cookies.key?('psg_auth_token')
          raise PassageError.new(
            status_code: 400,
            body: {
              error: 'missing authentication token: expected "psg_auth_token" cookie',
              code: 403
            }
          )
        end
        @token = request.cookies['psg_auth_token']
      else
        headers = request.headers
        unless headers.key?('Authorization')
          raise PassageError.new(
            status_code: 400,
            body: {
              error: 'no authentication token in header',
              code: 403
            }
          )
        end

        @token = headers['Authorization'].split(' ').last
      end

      validate_jwt(@token)
    end

    def validate_jwt(token)
      return authenticate_token(token) if token

      raise PassageError.new(
        status_code: 400,
        body: {
          error: 'no authentication token',
          code: 403
        }
      )
    end

    def revoke_user_refresh_tokens(user_id)
      warn 'NOTE: Passage::Auth#revoke_user_refresh_tokens is deprecated;
        use Passage::User#revoke_refresh_tokens instead. It will be removed on or after 2024-12.'
      user_exists?(user_id)

      client = OpenapiClient::TokensApi.new
      client.revoke_user_refresh_tokens(@app_id, user_id, @req_opts)
      true
    rescue Faraday::Error => e
      raise PassageError.new(
        status_code: e.response[:status],
        body: e.response[:body]
      )
    end

    # rubocop:disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Metrics/ParameterLists
    def create_magic_link(
      user_id: '',
      email: '',
      phone: '',
      channel: '',
      send: false,
      magic_link_path: '',
      redirect_url: '',
      language: '',
      ttl: 60,
      type: 'login'
    )
      magic_link_req = {}
      magic_link_req['user_id'] = user_id unless user_id.empty?
      magic_link_req['email'] = email unless email.empty?
      magic_link_req['phone'] = phone unless phone.empty?

      # check to see if the channel specified is valid before sending it off to the server
      unless [PHONE_CHANNEL, EMAIL_CHANNEL].include? channel
        raise PassageError.new(
          status_code: 400,
          body: {
            error: 'channel: must be either Passage::EMAIL_CHANNEL or Passage::PHONE_CHANNEL',
            code: 400
          }
        )
      end
      magic_link_req['channel'] = channel unless channel.empty?
      magic_link_req['send'] = send
      unless magic_link_path.empty?
        magic_link_req[
          'magic_link_path'
        ] = magic_link_path
      end
      magic_link_req['redirect_url'] = redirect_url unless redirect_url.empty?
      magic_link_req['language'] = language
      magic_link_req['ttl'] = ttl unless ttl.zero?
      magic_link_req['type'] = type

      begin
        client = OpenapiClient::MagicLinksApi.new
        client.create_magic_link(@app_id, magic_link_req, @req_opts).magic_link
      rescue Faraday::Error => e
        raise PassageError.new(
          status_code: e.response[:status],
          body: e.response[:body]
        )
      end
    end
    # rubocop:enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Metrics/ParameterLists

    def fetch_app
      client = OpenapiClient::AppsApi.new
      response = client.get_app(@app_id)

      response.app
    rescue Faraday::Error => e
      raise PassageError.new(
        status_code: e.response[:status],
        body: e.response[:body]
      )
    end

    def fetch_jwks
      app_cache = cache(@app_id)
      if app_cache
        @jwks, @auth_origin = app_cache
      else
        auth_gw_connection =
          Faraday.new(url: 'https://auth.passage.id') do |f|
            f.request :json
            f.response :raise_error
            f.response :json
            f.adapter :net_http
          end

        # fetch the public key if not in cache
        app = fetch_app

        @auth_origin = app.auth_origin
        response =
          auth_gw_connection.get("/v1/apps/#{@app_id}/.well-known/jwks.json")
        @jwks = response.body

        !cache(@app_id) && cache(key: @app_id, jwks: @jwks)
      end
    end

    def authenticate_token(token)
      kid = JWT.decode(token, nil, false)[1]['kid']
      fetch_jwks unless jwks.find { |key| key['kid'] == kid }

      claims =
        JWT.decode(
          token,
          nil,
          true,
          {
            aud: @auth_origin,
            verify_aud: true,
            algorithms: ['RS256'],
            jwks: @jwks
          }
        )
      claims[0]['sub']
    rescue JWT::InvalidIssuerError, JWT::InvalidAudError, JWT::ExpiredSignature, JWT::IncorrectAlgorithm,
           JWT::DecodeError => e
      raise PassageError.new(
        status_code: 400,
        body: {
          error: e.message,
          code: 400
        }
      )
    end

    private

    def user_exists?(user_id)
      return unless user_id.to_s.empty?

      raise PassageError.new(
        status_code: 400,
        body: {
          error: 'Must supply a valid user_id',
          code: 400
        }
      )
    end

    def cache(key)
      ::Rails.cache.read(key)
    end

    def cache=(key:, jwks:)
      ::Rails.cache.write(key, jwks, expires_in: 1.hour)
    end
    # rubocop:enable Metrics/AbcSize

    deprecate(:authenticate_request, :validate_jwt, 2025, 1)
    deprecate(:authenticate_token, :none, 2025, 1)
    deprecate(:fetch_app, :none, 2025, 1)
    deprecate(:fetch_jwks, :none, 2025, 1)
  end
end
