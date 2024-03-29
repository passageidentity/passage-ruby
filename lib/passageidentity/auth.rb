require "openssl"
require "base64"
require "jwt"
require_relative "client"
require_relative "../openapi_client"

module Passage
  class Auth
    @@app_cache = {}
    def initialize(app_id, auth_strategy)
      @app_id = app_id
      @auth_strategy = auth_strategy

      fetch_jwks
    end

    def fetch_app()
      begin
        client = OpenapiClient::AppsApi.new
        response = client.get_app(@app_id)
        
        return response.app
      rescue Faraday::Error => e
        raise PassageError.new(
                message: "failed to fetch passage app",
                status_code: e.response[:status],
                body: e.response[:body]
              )
      end
    end

    def fetch_jwks()
      if @@app_cache[@app_id]
        @jwks, @auth_origin = @@app_cache[@app_id]
      else
        app = fetch_app
        auth_gw_connection =
          Faraday.new(url: "https://auth.passage.id") do |f|
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
        @@app_cache[@app_id] ||= [@jwks, @auth_origin]
      end
    end

    def authenticate_request(request)
      warn "[DEPRECATION] `auth.authenticate_request()` is deprecated.  Please use `auth.validate_jwt()` instead."

      # Get the token based on the strategy
      if @auth_strategy === Passage::COOKIE_STRATEGY
        unless request.cookies.key?("psg_auth_token")
          raise PassageError.new(
                  message:
                    "missing authentication token: expected \"psg_auth_token\" cookie"
                )
        end
        @token = request.cookies["psg_auth_token"]
      else
        headers = request.headers
        unless headers.key?("Authorization")
          raise PassageError.new(message: "no authentication token in header")
        end
        @token = headers["Authorization"].split(" ").last
      end

      # authenticate the token
      if @token
        return authenticate_token(@token)
      else
        raise PassageError.new(message: "no authentication token")
      end
      nil
    end

    def validate_jwt(token)
      if token
        return authenticate_token(token)
      else
        raise PassageError.new(message: "no authentication token")
      end
    end

    def authenticate_token(token)
      begin
        kid = JWT.decode(token, nil, false)[1]["kid"]
        exists = false
        for jwk in @jwks["keys"]
          if jwk["kid"] == kid
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
              algorithms: ["RS256"],
              jwks: @jwks
            }
          )
        return claims[0]["sub"]
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
    end

    def revoke_user_refresh_tokens(user_id)
      begin
        client = OpenapiClient::TokensApi.new
        response = client.revoke_user_refresh_tokens(@app_id, user_id)
        return true
      rescue Faraday::Error => e
        raise PassageError.new(
                message: "failed to revoke user's refresh tokens",
                status_code: e.response[:status],
                body: e.response[:body]
              )
      end
    end
  end
end
