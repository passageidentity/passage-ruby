# frozen_string_literal: true

require_relative "auth"
require_relative "user_api"
require_relative "error"
require "rubygems"

module Passage
  App =
    Struct.new :name,
               :id,
               :auth_origin,
               :redirect_url,
               :login_url,
               :rsa_public_key,
               :allowed_identifer,
               :require_identifier_verification,
               :session_timeout_length,
               :refresh_enabled,
               :refresh_absolute_lifetime,
               :refresh_inactivity_lifetime,
               :user_metadata_schema,
               :layouts,
               :default_language,
               :auth_fallback_method,
               :auth_fallback_method_ttl,
               keyword_init: true

  User =
    Struct.new :id,
               :status,
               :email,
               :phone,
               :email_verified,
               :phone_verified,
               :created_at,
               :updated_at,
               :last_login_at,
               :login_count,
               :recent_events,
               :webauthn,
               :webauthn_devices,
               :user_metadata,
               keyword_init: true
  MagicLink =
    Struct.new :id,
               :secret,
               :activated,
               :user_id,
               :app_id,
               :identifier,
               :type,
               :redirect_url,
               :ttl,
               :url,
               keyword_init: true
  Device =
    Struct.new :id,
               :cred_id,
               :friendly_name,
               :usage_count,
               :updated_at,
               :created_at,
               :last_login_at,
               keyword_init: true

  COOKIE_STRATEGY = 0
  HEADER_STRATEGY = 1

  EMAIL_CHANNEL = "email"
  PHONE_CHANNEL = "phone"

  class Client
    attr_reader :auth
    attr_reader :user

    def initialize(app_id:, api_key: "", auth_strategy: COOKIE_STRATEGY)
      @app_id = app_id
      @api_key = api_key

      # check for valid auth strategy
      unless [COOKIE_STRATEGY, HEADER_STRATEGY].include? auth_strategy
        raise PassageError.new(message: "invalid auth strategy.")
      end
      @auth_strategy = auth_strategy

      # initialize auth class
      @auth = Passage::Auth.new(@app_id, @auth_strategy)

      # initialize user class
      @user = Passage::UserAPI.new(@app_id, @api_key)
    end

    # def get_connection
    #   gemspec = File.join(__dir__, "../../passageidentity.gemspec")
    #   spec = Gem::Specification.load(gemspec)
    #   headers = { "Passage-Version" => "passage-ruby #{spec.version}" }
    #   headers["Authorization"] = "Bearer #{@api_key}" if @api_key != ""

    #   @connection =
    #     Faraday.new(url: @api_url, headers: headers) do |f|
    #       f.request :json
    #       f.request :retry
    #       f.response :raise_error
    #       f.response :json
    #       f.adapter :net_http
    #     end
    # end

    def get_app()
      begin
        app_info = @auth.fetch_app()
        return OpenapiClient::AppsApi.get_app(@app_id)
      rescue => e
        raise e
      end
    end

    def create_magic_link(
      user_id: "",
      email: "",
      phone: "",
      channel: "",
      send: false,
      magic_link_path: "",
      redirect_url: "",
      language: "",
      ttl: 60,
      type: "login"
    )
      magic_link_req = {}
      magic_link_req["user_id"] = user_id unless user_id.empty?
      magic_link_req["email"] = email unless email.empty?
      magic_link_req["phone"] = phone unless phone.empty?

      # check to see if the channel specified is valid before sending it off to the server
      unless [PHONE_CHANNEL, EMAIL_CHANNEL].include? channel
        raise PassageError.new(
                message:
                  "channel: must be either Passage::EMAIL_CHANNEL or Passage::PHONE_CHANNEL"
              )
      end
      magic_link_req["channel"] = channel unless channel.empty?
      magic_link_req["send"] = send
      magic_link_req[
        "magic_link_path"
      ] = magic_link_path unless magic_link_path.empty?
      magic_link_req["redirect_url"] = redirect_url unless redirect_url.empty?
      magic_link_req["ttl"] = ttl unless ttl == 0
      magic_link_req["type"] = type

      begin
        response = OpenapiClient::MagicLinksApi.create_magic_link(@app_id, magic_link_req)
        magic_link = response.body["magic_link"]
        return(
          OpenapiClient::MagicLinkApi.new(
            id: magic_link["id"],
            secret: magic_link["secret"],
            activated: magic_link["activated"],
            user_id: magic_link["user_id"],
            app_id: magic_link["app_id"],
            identifier: magic_link["identifier"],
            type: magic_link["type"],
            redirect_url: magic_link["redirect_url"],
            ttl: magic_link["ttl"],
            url: magic_link["url"]
          )
        )
      rescue Faraday::Error => e
        raise PassageError.new(
                message: "failed to create Passage Magic Link",
                status_code: e.response[:status],
                body: e.response[:body]
              )
      end
    end
  end
end
