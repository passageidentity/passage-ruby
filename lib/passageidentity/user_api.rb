require_relative "client"

module Passage
  class UserAPI
    # This class will require an API key
    def initialize(app_id, api_key)
      @app_id = app_id
      @api_key = api_key
      @user_client = OpenapiClient::UsersApi.new
      @user_device_client = OpenapiClient::UserDevicesApi.new

      header_params = { "Passage-Version" => "passage-ruby #{Passage::VERSION}"}
      header_params["Authorization"] = "Bearer #{@api_key}" if @api_key != ""
      
      @req_opts = {}
      @req_opts[:header_params] = header_params
      @req_opts[:debug_auth_names] = ["header"]
      
    end

    def get(user_id:)
      user_exists?(user_id)

      begin
        response = @user_client.get_user(@app_id, user_id, @req_opts)
        user = response.user
        return user
      rescue Faraday::Error => e
        if e.is_a? Faraday::ResourceNotFound
          raise PassageError.new(
                  message: "Passage User with ID \"#{user_id}\" does not exist",
                  status_code: e.response[:status],
                  body: e.response[:body]
                )
        else
          raise PassageError.new(
                  message: "failed to get Passage User.",
                  status_code: e.response[:status],
                  body: e.response[:body]
                )
        end
      end
    end

    def get_by_identifier(user_identifier:)
      identifier_exists?(user_identifier)

      begin
        @req_opts[:limit] = 1
        @req_opts[:identifier] = user_identifier
        response = @user_client.list_paginated_users(@app_id, @req_opts)
        users = response.users

        if users.length() == 0
          raise PassageError.new(
                  message: "Passage User with identifer \"#{user_identifier}\" does not exist",
                  status_code: 404,
                  body: "user_not_found"
                )
        end
        return get(user_id: users.first().id)
      rescue Faraday::Error => e
        if e.is_a? Faraday::ResourceNotFound
          raise PassageError.new(
                  message: "Passage User with identifer \"#{user_identifier}\" does not exist",
                  status_code: e.response[:status],
                  body: e.response[:body]
                )
        else
          raise PassageError.new(
                  message: "failed to get Passage User.",
                  status_code: e.response[:status],
                  body: e.response[:body]
                )
        end
      end
    end

    def activate(user_id:)
      user_exists?(user_id)

      begin
        response = @user_client.activate_user(@app_id, user_id, @req_opts)
        return response.user
      rescue Faraday::Error => e
        if e.is_a? Faraday::ResourceNotFound
          raise PassageError.new(
                  message: "Passage User with ID \"#{user_id}\" does not exist",
                  status_code: e.response[:status],
                  body: e.response[:body]
                )
        else
          raise PassageError.new(
                  message: "failed to activate Passage User.",
                  status_code: e.response[:status],
                  body: e.response[:body]
                )
        end
      end
    end

    def deactivate(user_id:)
      user_exists?(user_id)

      begin
        response = @user_client.deactivate_user(@app_id, user_id, @req_opts)
        return response.user
      rescue Faraday::Error => e
        if e.is_a? Faraday::ResourceNotFound
          raise PassageError.new(
                  message: "Passage User with ID \"#{user_id}\" does not exist",
                  status_code: e.response[:status],
                  body: e.response[:body]
                )
        else
          raise PassageError.new(
                  message: "failed to deactivate Passage User.",
                  status_code: e.response[:status],
                  body: e.response[:body]
                )
        end
      end
    end

    def update(user_id:, email: "", phone: "", user_metadata: {})
      user_exists?(user_id)

      updates = {}
      updates["email"] = email unless email.empty?
      updates["phone"] = phone unless phone.empty?
      updates["user_metadata"] = user_metadata unless user_metadata.empty?
      begin
        response = @user_client.update_user(@app_id, user_id, updates, @req_opts)
        return response.user
      rescue Faraday::Error => e
        if e.is_a? Faraday::ResourceNotFound
          raise PassageError.new(
                  message: "Passage User with ID \"#{user_id}\" does not exist",
                  status_code: e.response[:status],
                  body: e.response[:body]
                )
        else
          raise PassageError.new(
                  "failed to update Passage User",
                  status_code: e.response[:status],
                  body: e.response[:body]
                )
        end
      end
    end

    def create(email: "", phone: "", user_metadata: {})
      create = {}
      create["email"] = email unless email.empty?
      create["phone"] = phone unless phone.empty?
      create["user_metadata"] = user_metadata unless user_metadata.empty?
      begin
        response = @user_client.create_user(@app_id, create, @req_opts)
        return response.user
      rescue Faraday::Error => e
        raise PassageError.new(
                "failed to create Passage User",
                status_code: e.response[:status],
                body: e.response[:body]
              )
      end
    end

    def delete(user_id:)
      user_exists?(user_id)

      begin
        response = @user_client.delete_user(@app_id, user_id, @req_opts)
        return true
      rescue Faraday::Error => e
        if e.is_a? Faraday::ResourceNotFound
          raise PassageError.new(
                  "passage User with ID \"#{user_id}\" does not exist",
                  status_code: e.response[:status],
                  body: e.response[:body]
                )
        else
          raise PassageError.new(
                  "failed to delete Passage User",
                  status_code: e.response[:status],
                  body: e.response[:body]
                )
        end
      end
    end

    def delete_device(user_id:, device_id:)
      user_exists?(user_id)
      device_exists?(device_id)

      begin
        response = @user_device_client.delete_user_devices(@app_id, user_id, device_id, @req_opts)
        return true
      rescue Faraday::Error => e
        raise PassageError.new(
                "failed to delete Passage User Device",
                status_code: e.response[:status],
                body: e.response[:body]
              )
      end
    end

    def list_devices(user_id:)
      user_exists?(user_id)

      begin
        response = @user_device_client.list_user_devices(@app_id, user_id, @req_opts)
        return response.devices
      rescue Faraday::Error => e
        raise PassageError.new(
                "failed to delete Passage User Device",
                status_code: e.response[:status],
                body: e.response[:body]
              )
      end
    end

    def signout(user_id:)
      warn "[DEPRECATION] `user.signout()` is deprecated.  Please use `auth.revoke_user_refresh_tokens()` instead."
      user_exists?(user_id)
      begin
        tokens_client = OpenapiClient::TokensApi.new
        response = tokens_client.revoke_user_refresh_tokens(@app_id, user_id, @req_opts)
        return true
      rescue Faraday::Error => e
        raise PassageError.new(
                "failed to revoke user's refresh tokens",
                status_code: e.response[:status],
                body: e.response[:body]
              )
      end
    end

    private

    def user_exists?(user_id)
      if user_id.to_s.empty?
        raise PassageError.new(message: "must supply a valid user_id")
      end
    end

    def identifier_exists?(identifier)
      if identifier.to_s.empty?
        raise PassageError.new(message: "must supply a valid identifier")
      end
    end

    def device_exists?(device_id)
      if device_id.to_s.empty?
        raise PassageError.new(message: "must supply a valid device_id")
      end
    end
  end
end
