# frozen_string_literal: true

require_relative 'auth'
require_relative 'user_api'
require_relative 'error'
require_relative 'version'

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

      @auth = Passage::Auth.new(@app_id, @api_key, @auth_strategy)
      @user = Passage::UserAPI.new(@app_id, @api_key)
    end
  end
end
