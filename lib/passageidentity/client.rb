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

    def initialize(app_id:, api_key:)
      unless app_id && !app_id.empty?
        raise ArgumentError,
              'A Passage App ID is required. Please include (app_id: YOUR_APP_ID, api_key: YOUR_API_KEY).'
      end
      unless api_key && !api_key.empty?
        raise ArgumentError,
              'A Passage API key is required. Please include (app_id: YOUR_APP_ID, api_key: YOUR_API_KEY).'
      end

      req_opts = {}
      req_opts[:header_params] = {
        'Passage-Version' => "passage-ruby #{Passage::VERSION}",
        'Authorization' => "Bearer #{@api_key}"
      }
      req_opts[:debug_auth_names] = ['header']

      @auth = Passage::Auth.new(@app_id, req_opts)
      @user = Passage::UserAPI.new(@app_id, req_opts)
    end
  end
end
