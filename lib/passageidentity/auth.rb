# frozen_string_literal: true

require 'active_support'
require 'jwt'
require_relative 'client'
require_relative '../openapi_client'

module Passage
  # The Passage::Auth class provides methods for authenticating requests and tokens
  class Auth
    def initialize(app_id:, req_opts:)
      @app_id = app_id
      @req_opts = req_opts

      @app_cache = ActiveSupport::Cache::MemoryStore.new
      fetch_jwks

      @magic_links_client = OpenapiClient::MagicLinksApi.new
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

    private

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
  end
end
