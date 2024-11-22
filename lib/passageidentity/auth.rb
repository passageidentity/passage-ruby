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
    end

    def authenticate_request(request)
      # Get the token based on the strategy
      if @auth_strategy == Passage::COOKIE_STRATEGY
        unless request.cookies.key?('psg_auth_token')
          raise PassageError.new(
            message:
              'missing authentication token: expected "psg_auth_token" cookie'
          )
        end
        @token = request.cookies['psg_auth_token']
      else
        headers = request.headers
        raise PassageError.new(message: 'no authentication token in header') unless headers.key?('Authorization')

        @token = headers['Authorization'].split(' ').last
      end

      validate_jwt(@token)
    end

    def validate_jwt(token)
      return authenticate_token(token) if token

      raise PassageError.new(message: 'no authentication token')
    end

    def revoke_user_refresh_tokens(user_id)
      warn 'NOTE: Passage::Auth#revoke_user_refresh_tokens is deprecated;
        use Passage::User#revoke_refresh_tokens instead. It will be removed on or after 2024-12.'
      user_exists?(user_id)

      begin
        tokens_client = OpenapiClient::TokensApi.new
        tokens_client.revoke_user_refresh_tokens(@app_id, user_id, @req_opts)
        true
      rescue Faraday::Error => e
        raise PassageError.new(
          "failed to revoke user's refresh tokens",
          status_code: e.response[:status],
          body: e.response[:body]
        )
      end
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
          message:
            'channel: must be either Passage::EMAIL_CHANNEL or Passage::PHONE_CHANNEL'
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
        gemspec = File.join(__dir__, '../../passageidentity.gemspec')
        Gem::Specification.load(gemspec)
        header_params = { 'Passage-Version' => "passage-ruby #{Passage::VERSION}" }
        header_params['Authorization'] = "Bearer #{@api_key}" if @api_key != ''

        opts = {}
        opts[:header_params] = header_params
        opts[:debug_auth_names] = ['header']

        client = OpenapiClient::MagicLinksApi.new
        client.create_magic_link(@app_id, magic_link_req, opts).magic_link
      rescue Faraday::Error => e
        raise PassageError.new(
          message: 'failed to create Passage Magic Link',
          status_code: e.response[:status],
          body: e.response[:body]
        )
      end
    end
    # rubocop:enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Metrics/ParameterLists

    private

    def fetch_app
      client = OpenapiClient::AppsApi.new
      response = client.get_app(@app_id)

      response.app
    rescue Faraday::Error => e
      raise PassageError.new(
        message: 'failed to fetch passage app',
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
            f.request :retry
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

        !get_cache(@app_id) && set_cache(@app_id, [@jwks, @auth_origin])
      end
    end

    def authenticate_token(token)
      kid = JWT.decode(token, nil, false)[1]['kid']
      exists = false
      (@jwks['keys']).each do |jwk|
        if jwk['kid'] == kid
          exists = true
          break
        end
      end
      fetch_jwks unless exists
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
    rescue JWT::InvalidIssuerError => e
      raise PassageError.new(message: e.message)
    rescue JWT::InvalidAudError => e
      raise PassageError.new(message: e.message)
    rescue JWT::ExpiredSignature => e
      raise PassageError.new(message: e.message)
    rescue JWT::IncorrectAlgorithm => e
      raise PassageError.new(message: e.message)
    rescue JWT::DecodeError => e
      raise PassageError.new(message: e.message)
    end

    def user_exists?(user_id)
      return unless user_id.to_s.empty?

      raise PassageError.new(message: 'must supply a valid user_id')
    end

    def get_cache(key)
      @app_cache[key]
    end

    def set_cache(key, value)
      @app_cache[key] = value
    end
    # rubocop:enable Metrics/AbcSize

    deprecate(:authenticate_request, :validate_jwt, 2024, 12)
  end
end
