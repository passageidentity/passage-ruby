# frozen_string_literal: true

require_relative '../openapi_client'

module Passage
  # The User class provides methods for interacting with Passage Users
  class User
    def initialize(app_id:, req_opts:)
      @app_id = app_id
      @req_opts = req_opts

      @user_client = OpenapiClient::UsersApi.new
      @user_device_client = OpenapiClient::UserDevicesApi.new
      @tokens_client = OpenapiClient::TokensApi.new
    end

    def get(user_id:)
      raise ArgumentError, 'user_id is required.' unless user_id && !user_id.empty?

      begin
        response = @user_client.get_user(@app_id, user_id, @req_opts)
        response.user
      rescue Faraday::Error => e
        raise PassageError.new(
          status_code: e.response[:status],
          body: e.response[:body]
        )
      end
    end

    def get_by_identifier(identifier:)
      raise ArgumentError, 'identifier is required.' unless identifier && !identifier.empty?

      begin
        req_opts = set_get_by_identifier_query_params(identifier: identifier)
        response = @user_client.list_paginated_users(@app_id, req_opts)
      rescue Faraday::Error => e
        raise PassageError.new(
          status_code: e.response[:status],
          body: e.response[:body]
        )
      end

      handle_get_by_identifier(users: response.users)
    end

    def activate(user_id:)
      raise ArgumentError, 'user_id is required.' unless user_id && !user_id.empty?

      begin
        response = @user_client.activate_user(@app_id, user_id, @req_opts)
        response.user
      rescue Faraday::Error => e
        raise PassageError.new(
          status_code: e.response[:status],
          body: e.response[:body]
        )
      end
    end

    def deactivate(user_id:)
      raise ArgumentError, 'user_id is required.' unless user_id && !user_id.empty?

      begin
        response = @user_client.deactivate_user(@app_id, user_id, @req_opts)
        response.user
      rescue Faraday::Error => e
        raise PassageError.new(
          status_code: e.response[:status],
          body: e.response[:body]
        )
      end
    end

    def update(user_id:, options:)
      raise ArgumentError, 'user_id is required.' unless user_id && !user_id.empty?
      raise ArgumentError, 'options are required.' unless options && !options.empty?

      response = @user_client.update_user(@app_id, user_id, options, @req_opts)
      response.user
    rescue Faraday::Error => e
      raise PassageError.new(
        status_code: e.response[:status],
        body: e.response[:body]
      )
    end

    def create(args:)
      raise ArgumentError, 'At least one of args.email or args.phone is required.' unless args['phone'] || args['email']

      response = @user_client.create_user(@app_id, args, @req_opts)
      response.user
    rescue Faraday::Error => e
      raise PassageError.new(
        status_code: e.response[:status],
        body: e.response[:body]
      )
    end

    def delete(user_id:)
      raise ArgumentError, 'user_id is required.' unless user_id && !user_id.empty?

      begin
        @user_client.delete_user(@app_id, user_id, @req_opts)
        true
      rescue Faraday::Error => e
        raise PassageError.new(
          'failed to delete Passage User',
          status_code: e.response[:status],
          body: e.response[:body]
        )
      end
    end

    def revoke_device(user_id:, device_id:)
      raise ArgumentError, 'user_id is required.' unless user_id && !user_id.empty?
      raise ArgumentError, 'device_id is required.' unless device_id && !device_id.empty?

      begin
        @user_device_client.delete_user_devices(@app_id, user_id, device_id, @req_opts)
      rescue Faraday::Error => e
        raise PassageError.new(
          status_code: e.response[:status],
          body: e.response[:body]
        )
      end
    end

    def list_devices(user_id:)
      raise ArgumentError, 'user_id is required.' unless user_id && !user_id.empty?

      begin
        response = @user_device_client.list_user_devices(@app_id, user_id, @req_opts)
        response.devices
      rescue Faraday::Error => e
        raise PassageError.new(
          status_code: e.response[:status],
          body: e.response[:body]
        )
      end
    end

    def revoke_refresh_tokens(user_id:)
      raise ArgumentError, 'user_id is required.' unless user_id && !user_id.empty?

      begin
        @tokens_client.revoke_user_refresh_tokens(@app_id, user_id, @req_opts)
      rescue Faraday::Error => e
        raise PassageError.new(
          status_code: e.response[:status],
          body: e.response[:body]
        )
      end
    end

    private

    def set_get_by_identifier_query_params(identifier:)
      req_opts = @req_opts.dup
      req_opts[:limit] = 1
      req_opts[:identifier] = identifier.downcase
      req_opts
    end

    def handle_get_by_identifier(users:)
      if users.empty?
        raise PassageError.new(
          status_code: 404,
          body: {
            error: 'User not found.',
            code: 'user_not_found'
          }
        )
      end

      get(user_id: users.first.id)
    end
  end
end
