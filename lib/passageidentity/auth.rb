# frozen_string_literal: true

require 'active_support'
require 'jwt'
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

      claims =
        JWT.decode(
          token,
          nil,
          true,
          {
            aud: @app_id,
            verify_aud: true,
            algorithms: ['RS256'],
            jwks: fetch_jwks
          }
        )

      claims[0]['sub']
    end

    def create_magic_link_with_email(email, type, send, opts = {})
      args = {}
      args['email'] = email
      args['channel'] = 'email'
      args['type'] = type
      args['send'] = send

      create_magic_link(args, opts)
    end

    def create_magic_link_with_phone(phone, type, send, opts = {})
      args = {}
      args['phone'] = phone
      args['channel'] = 'phone'
      args['type'] = type
      args['send'] = send

      create_magic_link(args, opts)
    end

    def create_magic_link_with_user(user_id, channel, type, send, opts = {})
      raise ArgumentError, "channel must be either 'email' or 'phone'" unless %w[
        email
        phone
      ].include?(channel)

      args = {}
      args['user_id'] = user_id
      args['channel'] = channel
      args['type'] = type
      args['send'] = send

      create_magic_link(args, opts)
    end

    private

    def fetch_jwks
      jwks = @app_cache.read(@app_id)
      return jwks if jwks

      auth_gw_connection =
        Faraday.new(url: 'https://auth.passage.id') do |f|
          f.request :json
          f.response :raise_error
          f.response :json
          f.adapter :net_http
        end

      response = auth_gw_connection.get("/v1/apps/#{@app_id}/.well-known/jwks.json")
      jwks = response.body

      @app_cache.write(@app_id, jwks, expires_in: 86_400) # 24 hours in seconds
      jwks
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
  end
end
