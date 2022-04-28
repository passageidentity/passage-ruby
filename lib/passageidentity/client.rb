# frozen_string_literal: true

require_relative 'auth'
require_relative 'user_api'
require_relative 'error'

module Passage

    User = Struct.new :id, :status, :email, :phone, :email_verified, :created_at, :last_login, :user_metadata
    MagicLink = Struct.new :id, :secret, :activated, :user_id, :app_id, :identifier, :type, :redirect_url, :ttl, :url

    COOKIE_STRATEGY = 0
    HEADER_STRATEGY = 1

    EMAIL_CHANNEL = "email"
    PHONE_CHANNEL = "phone"

    class Client

        @@app_cache = {}

        attr_reader :auth
        attr_reader :user

        def initialize(app_id:, api_key: "", auth_strategy: COOKIE_STRATEGY)
            @api_url = "https://api.passage.id"
            @app_id = app_id
            @api_key = api_key

            # check for valid auth strategy
            raise PassageError, "invalid auth strategy." unless [COOKIE_STRATEGY, HEADER_STRATEGY].include? auth_strategy
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
            if @api_key == ""
                @connection = Faraday.new(url: @api_url) do |f|
                    f.request :json
                    f.request :retry
                    f.response :raise_error
                    f.response :json
                    f.adapter :net_http
                end
            else
                @connection = Faraday.new(url: @api_url, headers: {"Authorization" => "Bearer #{@api_key}"}) do |f|
                    f.request :json
                    f.request :retry
                    f.response :raise_error
                    f.response :json
                    f.adapter :net_http
                end
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

        def create_magic_link(user_id: "", email: "", phone: "", channel: "", send: false, magic_link_path: "", redirect_url: "", ttl: 60)
            magic_link_req = {}
            magic_link_req["user_id"] = user_id unless user_id.empty?
            magic_link_req["email"] = email unless email.empty?
            magic_link_req["phone"] = phone unless phone.empty?
            # check to see if the channel specified is valid before sending it off to the server
            raise PassageError, "channel: must be either Passage::EMAIL_CHANNEL or Passage::PHONE_CHANNEL" unless [PHONE_CHANNEL, EMAIL_CHANNEL].include? channel
            magic_link_req["channel"] = channel unless channel.empty?
            magic_link_req["send"] = send
            magic_link_req["magic_link_path"] = magic_link_path unless magic_link_path.empty?
            magic_link_req["redirect_url"] = redirect_url unless redirect_url.empty?
            magic_link_req["ttl"] = ttl unless ttl == 0

            begin
                response = @connection.post("/v1/apps/#{@app_id}/magic-links", magic_link_req)
                magic_link = response.body["magic_link"]
                return Passage::MagicLink.new(magic_link['id'], magic_link["secret"], magic_link["activated"], magic_link['user_id'], magic_link['app_id'], magic_link["identifier"], magic_link["type"], magic_link["redirect_url"], magic_link["ttl"], magic_link["url"])
            rescue Faraday::Error => e
                raise PassageError, "failed to create Passage Magic Link. Http Status: #{e.response[:status]}. Response: #{e.response[:body]["error"]}"
            end
        end
    end
end
