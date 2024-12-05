# frozen_string_literal: true

require 'active_support'
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
      @app_cache = ActiveSupport::Cache::MemoryStore.new
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
              code: 'missing_auth_token'
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
              code: 'missing_auth_token'
            }
          )
        end

        @token = headers['Authorization'].split(' ').last
      end

      validate_jwt(@token)
    end

    def validate_jwt(token)
      if token.nil?
        raise PassageError.new(
          status_code: 400,
          body: {
            error: 'no authentication token',
            code: 'missing_auth_token'
          }
        )
      end

      exists = jwk_exists(token)
      fetch_jwks unless exists

      unless get_cache(@app_id)
        raise PassageError.new(
          status_code: 401,
          body: {
            error: 'invalid authentication token',
            code: 'invalid_jwks'
          }
        )
      end

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
        status_code: 401,
        body: {
          error: e.message,
          code: 'invalid_jwt'
        }
      )
    end

    def revoke_user_refresh_tokens(user_id)
      warn 'NOTE: Passage::Auth#revoke_user_refresh_tokens is deprecated;
        use Passage::User#revoke_refresh_tokens instead. It will be removed on or after 2024-12.'
      user_exists?(user_id)

      client = OpenapiClient::TokensApi.new
      client.revoke_user_refresh_tokens(@app_id, user_id, @req_opts)
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
            code: 'bad_request_data'
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
      app_cache = get_cache(@app_id)

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

        if response.success?
          @jwks = response.body
          set_cache(key: @app_id, jwks: @jwks)
        end
      end
    end

    def authenticate_token(token)
      validate_jwt(token)
    end

    private

    def user_exists?(user_id)
      return unless user_id.to_s.empty?

      raise PassageError.new(
        status_code: 400,
        body: {
          error: 'Must supply a valid user_id',
          code: 'user_not_found'
        }
      )
    end

    def get_cache(key)
      @app_cache.read(key)
    end

    def set_cache(key:, jwks:)
      @app_cache.write(key, jwks)
    end

    def jwk_exists(token)
      kid = JWT.decode(token, nil, false)[1]['kid']
      @jwks['keys'].any? { |jwk| jwk['kid'] == kid }
    end
    # rubocop:enable Metrics/AbcSize

    deprecate(:authenticate_request, :validate_jwt, 2025, 1)
    deprecate(:authenticate_token, :validate_jwt, 2025, 1)
    deprecate(:fetch_app, :none, 2025, 1)
    deprecate(:fetch_jwks, :none, 2025, 1)
  end
end
