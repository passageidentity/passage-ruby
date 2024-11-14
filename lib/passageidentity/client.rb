# frozen_string_literal: true

require_relative 'auth'
require_relative 'user_api'
require_relative 'error'
require_relative 'version'
require 'rubygems'
require_relative '../openapi_client'

module Passage
  COOKIE_STRATEGY = 0
  HEADER_STRATEGY = 1

  EMAIL_CHANNEL = 'email'
  PHONE_CHANNEL = 'phone'

  # The Passage::Client class provides methods for interacting with Passage
  class Client
    attr_reader :auth, :user

    def initialize(app_id:, api_key: '', auth_strategy: COOKIE_STRATEGY)
      @app_id = app_id
      @api_key = api_key

      # check for valid auth strategy
      unless [COOKIE_STRATEGY, HEADER_STRATEGY].include? auth_strategy
        raise PassageError.new(message: 'invalid auth strategy.')
      end

      @auth_strategy = auth_strategy

      # initialize auth class
      @auth = Passage::Auth.new(@app_id, @auth_strategy)

      # initialize user class
      @user = Passage::UserAPI.new(@app_id, @api_key)
    end

    def get_app
      client = OpenapiClient::AppsApi.new
      client.get_app(@app_id).app
    rescue StandardError => e
      raise e
    end

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
      warn '[DEPRECATION] `create_magic_link()` is deprecated.  Please use `auth.create_magic_link()` instead.'
      
      magic_link_req = {}
      magic_link_req['user_id'] = user_id unless user_id.empty?
      magic_link_req['email'] = email unless email.empty?
      magic_link_req['phone'] = phone unless phone.empty?

      # check to see if the channel specified is valid before sending it off to the server
      unless [PHONE_CHANNEL, EMAIL_CHANNEL].include? channel
        raise PassageError.new(
          message:
            'channel: must be either Passage::EMAIL_CHANNEL or Passage::PHONE_CHANNEL'
        )
      end
      magic_link_req['channel'] = channel unless channel.empty?
      magic_link_req['send'] = send
      unless magic_link_path.empty?
        magic_link_req[
          'magic_link_path'
        ] = magic_link_path
      end
      magic_link_req['redirect_url'] = redirect_url unless redirect_url.empty?
      magic_link_req['language'] = language
      magic_link_req['ttl'] = ttl unless ttl.zero?
      magic_link_req['type'] = type

      begin
        gemspec = File.join(__dir__, '../../passageidentity.gemspec')
        Gem::Specification.load(gemspec)
        header_params = { 'Passage-Version' => "passage-ruby #{Passage::VERSION}" }
        header_params['Authorization'] = "Bearer #{@api_key}" if @api_key != ''

        opts = {}
        opts[:header_params] = header_params
        opts[:debug_auth_names] = ['header']

        client = OpenapiClient::MagicLinksApi.new
        client.create_magic_link(@app_id, magic_link_req, opts).magic_link
      rescue Faraday::Error => e
        raise PassageError.new(
          message: 'failed to create Passage Magic Link',
          status_code: e.response[:status],
          body: e.response[:body]
        )
      end
    end
  end
end
