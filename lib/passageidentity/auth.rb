require "openssl"
require "base64"
require "jwt"
require_relative "client"

module Passage
  class Auth
    @@app_cache = {}
    def initialize(app_id, auth_strategy, connection)
      @app_id = app_id
      @auth_strategy = auth_strategy
      @connection = connection

      fetch_jwks
    end

    def fetch_app()
      begin
        response = @connection.get("/v1/apps/#{@app_id}")
        return response.body["app"]
      rescue Faraday::Error => e
        raise PassageError,
              "failed to get Passage App. Http Status: #{e.response[:status]}. Response: #{e.response[:body]["error"]}"
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
        @auth_origin = app["auth_origin"]
        response =
          auth_gw_connection.get("/v1/apps/#{@app_id}/.well-known/jwks.json")
        @jwks = response.body
        @@app_cache[@app_id] ||= [@jwks, @auth_origin]
      end
    end

    def authenticate_request(request)
      # Get the token based on the strategy
      if @auth_strategy === Passage::COOKIE_STRATEGY
        unless request.cookies["psg_auth_token"].present?
          raise PassageError,
                `missing authentication token: expected "psg_auth_token" cookie`
        end
        @token = request.cookies["psg_auth_token"]
      else
        headers = request.headers
        unless headers["Authorization"].present?
          raise PassageError, "no authentication token in header"
        end
        @token = headers["Authorization"].split(" ").last
      end

      # authenticate the token
      if @token
        return authenticate_token(@token)
      else
        raise PassageError, "no authentication token"
      end
      nil
    end

    def authenticate_token(token)
      kid = JWT.decode(token, nil, false)[1]["kid"]
      exists = false
      for jwk in @jwks["keys"]
        if jwk["kid"] == kid
          exists = true
          break
        end
      end
      fetch_jwks unless exists
      begin
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
        raise Passage::PassageError, e.message
      rescue JWT::InvalidAudError => e
        raise Passage::PassageError, e.message
      rescue JWT::ExpiredSignature => e
        raise Passage::PassageError, e.message
      rescue JWT::IncorrectAlgorithm => e
        raise Passage::PassageError, e.message
      rescue JWT::DecodeError => e
        raise Passage::PassageError, e.message
      end
    end
  end
end
