require 'openssl'
require 'base64'
require 'jwt'

module Passage
    class Auth

        def initialize(app_id, public_key, auth_origin)

            @app_id = app_id
            @auth_origin = auth_origin

            # bas64 decode and then parse the public key
            # when we have JWKS endpoint, this will get easier I think
            @public_key = OpenSSL::PKey::RSA.new(Base64.decode64(public_key))

        end

        def authenticate(token)
  
            begin
              claims = JWT.decode(token, @public_key, true,{ iss: @app_id, verify_iss: true, aud: @auth_origin, verify_aud: true, algorithms: ["RS256"] })
              return claims[0]["sub"]
            rescue JWT::InvalidIssuerError
              raise JWTInvalidIssuerError
            rescue JWT::InvalidAudError
              raise JWTInvalidAudienceError
            rescue JWT::ExpiredSignature
              raise JWTExpiredSignatureError
            rescue JWT::IncorrectAlgorithm
              raise JWTIncorrectAlgorithmError
            end
          end
    end
end