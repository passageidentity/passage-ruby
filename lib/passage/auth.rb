require 'openssl'
require 'base64'
require 'jwt'
require_relative 'client'

module Passage
    class Auth

        def initialize(app_id, auth_strategy, public_key, auth_origin)

            @app_id = app_id
            @auth_strategy = auth_strategy
            @auth_origin = auth_origin

            # bas64 decode and then parse the public key
            # when we have JWKS endpoint, this will get easier I think
            @public_key = OpenSSL::PKey::RSA.new(Base64.decode64(public_key))

        end

        
        def authenticate_request(request)

            # Get the token based on the strategy
            if @auth_strategy === Passage::COOKIE_STRATEGY
                @token = request.cookies["psg_auth_token"]
            else
                headers = request.headers
                if headers['Authorization'].present?
                    @token = headers['Authorization'].split(' ').last
                else
                    raise PassageError, "no authentication token in header"
                end
            end

            # authenticate the token
            if @token
                return authenticate_token(@token)
            end
            nil
        end

        def authenticate_token(token)
  
            begin
              claims = JWT.decode(token, @public_key, true,{ iss: @app_id, verify_iss: true, aud: @auth_origin, verify_aud: true, algorithms: ["RS256"] })
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