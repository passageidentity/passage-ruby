# frozen_string_literal: true

require_relative 'request'
require_relative 'auth'

module Passage
    class Client

        attr_reader :auth

        def initialize(app_id:)
            @api_url = "https://api.passage.id"
            @app_id = app_id

            get_connection()

            fetch_public_key(@connection)

            @auth = Passage::Auth.new(@app_id, @public_key, @auth_origin)
        end

        def get_connection
            @connection = Faraday.new(url: @api_url) do |f|
                f.request :json
                f.request :retry
                f.response :json
                f.adapter :net_http
            end
        end

        def fetch_public_key(conn)
            response = conn.get("/v1/apps/" + @app_id)
            # TODO Add error handling
            @public_key = response.body["app"]["rsa_public_key"]
            @auth_origin = response.body["app"]["auth_origin"]
        end

    end
end