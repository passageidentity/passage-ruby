# frozen_string_literal: true

require_relative 'auth'
require_relative 'user'
require_relative 'version'

module Passage
  EMAIL_CHANNEL = 'email'
  PHONE_CHANNEL = 'phone'

  # The Passage::Client class provides methods for interacting with Passage
  class Client
    attr_reader :auth, :user

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
        'Authorization' => "Bearer #{api_key}"
      }
      req_opts[:debug_auth_names] = ['header']

      @auth = Passage::Auth.new(app_id: app_id, req_opts: req_opts)
      @user = Passage::User.new(app_id: app_id, req_opts: req_opts)
    end
  end
end
