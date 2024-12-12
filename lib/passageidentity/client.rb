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
        raise PassageError.new(
          status_code: 400,
          body: {
            error: 'Invalid auth strategy',
            code: 'invalid_argument'
          }
        )
      end

      @auth_strategy = auth_strategy

      header_params = { 'Passage-Version' => "passage-ruby #{Passage::VERSION}" }
      header_params['Authorization'] = "Bearer #{@api_key}" if @api_key != ''

      @req_opts = {}
      @req_opts[:header_params] = header_params
      @req_opts[:debug_auth_names] = ['header']

      # initialize auth class
      @auth = Passage::Auth.new(@app_id, @api_key, @auth_strategy)

      # initialize user class
      @user = Passage::UserAPI.new(@app_id, @api_key)

      @magic_links_client = OpenapiClient::MagicLinksApi.new
    end

    # rubocop:disable Naming/AccessorMethodName
    def get_app
      client = OpenapiClient::AppsApi.new
      client.get_app(@app_id).app
    rescue StandardError => e
      raise e
    end
    # rubocop:enable Naming/AccessorMethodName

    # rubocop:disable Metrics/ParameterLists, Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
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
      args = {}
      args['user_id'] = user_id unless user_id.empty?
      args['email'] = email unless email.empty?
      args['phone'] = phone unless phone.empty?

      unless [PHONE_CHANNEL, EMAIL_CHANNEL].include? channel
        raise PassageError.new(
          message:
            'channel: must be either Passage::EMAIL_CHANNEL or Passage::PHONE_CHANNEL'
        )
      end

      args['channel'] = channel unless channel.empty?
      args['type'] = type
      args['send'] = send

      args['language'] = language unless language.empty?
      args['magic_link_path'] = magic_link_path unless magic_link_path.empty?
      args['redirect_url'] = redirect_url unless redirect_url.empty?
      args['ttl'] = ttl unless ttl.zero?

      begin
        @magic_links_client.create_magic_link(@app_id, args, @req_opts).magic_link
      rescue Faraday::Error => e
        raise PassageError.new(
          status_code: e.response[:status],
          body: e.response[:body]
        )
      end
    end
    # rubocop:enable Metrics/ParameterLists, Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

    deprecate(:create_magic_link, 'Passage::Auth.create_magic_link', 2025, 1)
    deprecate(:get_app, :none, 2025, 1)
  end
end
