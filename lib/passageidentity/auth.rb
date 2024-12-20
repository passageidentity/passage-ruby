# frozen_string_literal: true

require 'active_support'
require 'jwt'
require 'rubygems/deprecate'
require_relative 'client'
require_relative '../openapi_client'

module Passage
  # The Passage::Auth class provides methods for authenticating requests and tokens
  class Auth
    extend Gem::Deprecate

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

      @tokens_client = OpenapiClient::TokensApi.new
      @magic_links_client = OpenapiClient::MagicLinksApi.new
    end

    def authenticate_request(request)
      # Get the token based on the strategy
      if @auth_strategy == Passage::COOKIE_STRATEGY
        unless request.cookies.key?('psg_auth_token')
          raise PassageError.new(
            status_code: 401,
            body: {
              error: 'missing authentication token: expected "psg_auth_token" cookie',
              code: 'invalid_access_token'
            }
          )
        end
        @token = request.cookies['psg_auth_token']
      else
        headers = request.headers
        unless headers.key?('Authorization')
          raise PassageError.new(
            status_code: 401,
            body: {
              error: 'no authentication token in header',
              code: 'invalid_access_token'
            }
          )
        end

        @token = headers['Authorization'].split(' ').last
      end

      validate_jwt(@token)
    end

    def validate_jwt(token)
      raise ArgumentError, 'jwt is required.' unless token && !token.empty?

      begin
        fetch_jwks
      rescue Faraday::Error
        raise PassageError.new(
          status_code: 401,
          body: {
            error: 'invalid JWKs',
            code: 'invalid_access_token'
          }
        )
      end

      claims =
        JWT.decode(
          token,
          nil,
          true,
          {
            aud: @app_id,
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
          code: 'invalid_access_token'
        }
      )
    end

    def revoke_user_refresh_tokens(user_id)
      warn 'NOTE: Passage::Auth#revoke_user_refresh_tokens is deprecated;
        use Passage::User#revoke_refresh_tokens instead. It will be removed on or after 2024-12.'
      user_exists?(user_id)

      @tokens_client.revoke_user_refresh_tokens(@app_id, user_id, @req_opts)
    rescue Faraday::Error => e
      raise PassageError.new(
        status_code: e.response[:status],
        body: e.response[:body]
      )
    end

    def create_magic_link_with_email(email, type, send, opts = {})
      args = {}
      args['email'] = email
      args['channel'] = EMAIL_CHANNEL
      args['type'] = type
      args['send'] = send

      create_magic_link(args, opts)
    end

    def create_magic_link_with_phone(phone, type, send, opts = {})
      args = {}
      args['phone'] = phone
      args['channel'] = PHONE_CHANNEL
      args['type'] = type
      args['send'] = send

      create_magic_link(args, opts)
    end

    def create_magic_link_with_user(user_id, channel, type, send, opts = {})
      args = {}
      args['user_id'] = user_id
      args['channel'] = channel
      args['type'] = type
      args['send'] = send

      create_magic_link(args, opts)
    end

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
        @jwks = app_cache
      else
        auth_gw_connection =
          Faraday.new(url: 'https://auth.passage.id') do |f|
            f.request :json
            f.response :raise_error
            f.response :json
            f.adapter :net_http
          end

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

    def create_magic_link(args, opts)
      args['language'] = opts['language']
      args['magic_link_path'] = opts['magic_link_path']
      args['redirect_url'] = opts['redirect_url']
      args['ttl'] = opts['ttl']

      handle_magic_link_creation(args)
    end

    def handle_magic_link_creation(args)
      @magic_links_client.create_magic_link(@app_id, args, @req_opts).magic_link
    rescue Faraday::Error => e
      raise PassageError.new(
        status_code: e.response[:status],
        body: e.response[:body]
      )
    rescue OpenapiClient::ApiError => e
      raise PassageError.new(
        status_code: e.code,
        body: try_parse_json_string(e.response_body)
      )
    end

    def try_parse_json_string(string)
      JSON.parse(string)
    rescue JSON::ParserError
      string
    end

    def user_exists?(user_id)
      return unless user_id.to_s.empty?

      raise PassageError.new(
        status_code: 400,
        body: {
          error: 'Must supply a valid user_id',
          code: 'invalid_request'
        }
      )
    end

    def get_cache(key)
      @app_cache.read(key)
    end

    def set_cache(key:, jwks:)
      @app_cache.write(key, jwks, expires_in: 86_400)
    end
    deprecate(:authenticate_request, :validate_jwt, 2025, 1)
    deprecate(:authenticate_token, :validate_jwt, 2025, 1)
    deprecate(:fetch_app, :none, 2025, 1)
    deprecate(:fetch_jwks, :none, 2025, 1)
  end
end
