# frozen_string_literal: true

require_relative 'auth'
require_relative 'error'

module Passage

    COOKIE_STRATEGY = 0
    HEADER_STRATEGY = 1

    class Client

        @@app_cache = {}

        attr_reader :auth

        def initialize(app_id:, auth_strategy: COOKIE_STRATEGY)
            @api_url = "https://api.passage.id"
            @app_id = app_id

            # check for valid auth strategy
            if ! [COOKIE_STRATEGY, HEADER_STRATEGY].include? auth_strategy
                raise PassageError, "invalid auth strategy."
            end
            @auth_strategy = auth_strategy

            # setup 
            get_connection()
            fetch_public_key(@connection)

            # initialize auth class
            @auth = Passage::Auth.new(@app_id, @auth_strategy, @public_key, @auth_origin)
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
            if @@app_cache[@app_id]
                @public_key, @auth_origin = @@app_cache[@app_id]
            else
                # fetch the public key if not in cache
                response = conn.get("/v1/apps/" + @app_id)
                @public_key = response.body["app"]["rsa_public_key"]
                @auth_origin = response.body["app"]["auth_origin"]
                @@app_cache[@app_id] ||= [@public_key, @auth_origin]
            end
        end

    end
end