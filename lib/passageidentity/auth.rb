# frozen_string_literal: true

require 'openssl'
require 'base64'
require 'jwt'
require_relative 'client'
require_relative '../openapi_client'

module Passage
  # The Passage::Auth class provides methods for authenticating requests and tokens
  # using the Passage authentication service. It supports fetching and caching
  # JSON Web Keys (JWKS) for token verification, and provides methods for
  # validating JWTs and revoking user refresh tokens.
  class Auth
    @app_cache = {}

    def initialize(app_id, auth_strategy)
      @app_id = app_id
      @auth_strategy = auth_strategy

      fetch_jwks
    end

    def get_cache(key)
      @app_cache[key]
    end

    def set_cache(key, value)
      @app_cache[key] = value
    end

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
        
        get_cache(@app_id).nil && set_cache(@app_id, [@jwks, @auth_origin])
      end
    end

    def authenticate_request(request)
      warn '[DEPRECATION] `auth.authenticate_request()` is deprecated.  Please use `auth.validate_jwt()` instead.'

      # Get the token based on the strategy
      
      if @auth_strategy.match?(Passage::COOKIE_STRATEGY)
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

      # authenticate the token
      return authenticate_token(@token) if @token

      raise PassageError.new(message: 'no authentication token')
    end

    def validate_jwt(token)
      return authenticate_token(token) if token

      raise PassageError.new(message: 'no authentication token')
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

    def revoke_user_refresh_tokens(user_id)
      client = OpenapiClient::TokensApi.new
      client.revoke_user_refresh_tokens(@app_id, user_id)
      true
    rescue Faraday::Error => e
      raise PassageError.new(
        message: "failed to revoke user's refresh tokens",
        status_code: e.response[:status],
        body: e.response[:body]
      )
    end
  end
end
