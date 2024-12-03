# frozen_string_literal: true

require 'rubygems'
require_relative 'auth'
require_relative 'user_api'
require_relative 'error'
require_relative 'version'
require_relative '../openapi_client'

module Passage
  COOKIE_STRATEGY = 0
  HEADER_STRATEGY = 1

  EMAIL_CHANNEL = 'email'
  PHONE_CHANNEL = 'phone'

  # The Passage::Client class provides methods for interacting with Passage
  class Client
    attr_reader :auth, :user

    extend Gem::Deprecate

    def initialize(app_id:, api_key: '', auth_strategy: COOKIE_STRATEGY)
      @app_id = app_id
      @api_key = api_key

      # check for valid auth strategy
      unless [COOKIE_STRATEGY, HEADER_STRATEGY].include? auth_strategy
        raise PassageError.new(message: 'invalid auth strategy.')
      end

      @auth_strategy = auth_strategy

      # initialize auth class
      @auth = Passage::Auth.new(@app_id, @api_key, @auth_strategy)

      # initialize user class
      @user = Passage::UserAPI.new(@app_id, @api_key)
    end

    # rubocop:disable Naming/AccessorMethodName
    def get_app
      client = OpenapiClient::AppsApi.new
      client.get_app(@app_id).app
    rescue StandardError => e
      raise e
    end
    # rubocop:enable Naming/AccessorMethodName

    # rubocop:disable Metrics/ParameterLists
    def create_magic_link(
      user_id: '',
      email: '',
      phone: '',
      channel: '',
      send: false,
      magic_link_path: '',
      redirect_url: '',
      language: '',
      ttl: 60,
      type: 'login'
    )
      @auth.create_magic_link(
        user_id: user_id,
        email: email,
        phone: phone,
        channel: channel,
        send: send,
        magic_link_path: magic_link_path,
        redirect_url: redirect_url,
        language: language,
        ttl: ttl,
        type: type
      )
    end
    # rubocop:enable Metrics/ParameterLists

    deprecate(:create_magic_link, 'Passage::Auth.create_magic_link', 2025, 1)
    deprecate(:get_app, :none, 2025, 1)
  end
end
