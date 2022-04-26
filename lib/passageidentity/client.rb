# frozen_string_literal: true

require_relative 'auth'
require_relative 'user_api'
require_relative 'error'

module Passage

    User = Struct.new :id, :status, :email, :phone, :email_verified, :created_at, :last_login
    UserUpdatesBody = Struct.new :email, :phone

    COOKIE_STRATEGY = 0
    HEADER_STRATEGY = 1

    class Client

        @@app_cache = {}

        attr_reader :auth
        attr_reader :user_api

        def initialize(app_id:, auth_strategy: COOKIE_STRATEGY, api_key:)
            @api_url = "https://api.passage.id"
            @app_id = app_id
            @api_key = api_key

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
            # initialize user class
            @user = Passage::UserAPI.new(@connection, @app_id, @api_key)
        end

        def get_connection
            @connection = Faraday.new(url: @api_url, headers: {"Authorization" => "Bearer #{@api_key}"}) do |f|
                f.request :json
                f.request :retry
                f.response :raise_error
                f.response :json
                f.adapter :net_http
            end
        end

        def fetch_public_key(conn)
            if @@app_cache[@app_id]
                @public_key, @auth_origin = @@app_cache[@app_id]
            else
                # fetch the public key if not in cache
                response = conn.get("/v1/apps/#{@app_id}")
                @public_key = response.body["app"]["rsa_public_key"]
                @auth_origin = response.body["app"]["auth_origin"]
                @@app_cache[@app_id] ||= [@public_key, @auth_origin]
            end
        end

    end
end