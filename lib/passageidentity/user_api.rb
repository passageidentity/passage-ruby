require_relative "client"

module Passage
  class UserAPI
    # This class will require an API key
    def initialize(connection, app_id, api_key)
      @connection = connection
      @app_id = app_id
      @api_key = api_key
    end

    def get(user_id:)
      user_exists?(user_id)

      begin
        response = @connection.get("/v1/apps/#{@app_id}/users/#{user_id}")
        user = response.body["user"]
        user.transform_keys(&:to_sym)
        return(
          Passage::User.new(
            id: user["id"],
            status: user["status"],
            email: user["email"],
            phone: user["phone"],
            email_verified: user["email_verified"],
            phone_verified: user["phone_verified"],
            created_at: user["created_at"],
            updated_at: user["updated_at"],
            last_login_at: user["last_login_at"],
            login_count: user["login_count"],
            webauthn: user["webauthn"],
            webauthn_devices: user["webauthn_devices"],
            recent_events: user["recent_events"],
            user_metadata: user["user_metadata"]
          )
        )
      rescue Faraday::Error => e
        if e.is_a? Faraday::ResourceNotFound
          raise PassageError,
                PassageError.new(
                  message: "Passage User with ID \"#{user_id}\" does not exist",
                  status_code: e.response[:status],
                  body: e.response[:body]
                )
        else
          raise PassageError,
                PassageError.new(
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
        response =
          @connection.patch("/v1/apps/#{@app_id}/users/#{user_id}/activate")
        user = response.body["user"]
        return(
          Passage::User.new(
            id: user["id"],
            status: user["status"],
            email: user["email"],
            phone: user["phone"],
            email_verified: user["email_verified"],
            phone_verified: user["phone_verified"],
            created_at: user["created_at"],
            updated_at: user["updated_at"],
            last_login_at: user["last_login_at"],
            login_count: user["login_count"],
            webauthn: user["webauthn"],
            webauthn_devices: user["webauthn_devices"],
            recent_events: user["recent_events"],
            user_metadata: user["user_metadata"]
          )
        )
      rescue Faraday::Error => e
        if e.is_a? Faraday::ResourceNotFound
          raise PassageError,
                PassageError.new(
                  message: "Passage User with ID \"#{user_id}\" does not exist",
                  status_code: e.response[:status],
                  body: e.response[:body]
                )
        else
          raise PassageError,
                PassageError.new(
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
        response =
          @connection.patch("/v1/apps/#{@app_id}/users/#{user_id}/deactivate")
        user = response.body["user"]
        return(
          Passage::User.new(
            id: user["id"],
            status: user["status"],
            email: user["email"],
            phone: user["phone"],
            email_verified: user["email_verified"],
            phone_verified: user["phone_verified"],
            created_at: user["created_at"],
            updated_at: user["updated_at"],
            last_login_at: user["last_login_at"],
            login_count: user["login_count"],
            webauthn: user["webauthn"],
            webauthn_devices: user["webauthn_devices"],
            recent_events: user["recent_events"],
            user_metadata: user["user_metadata"]
          )
        )
      rescue Faraday::Error => e
        if e.is_a? Faraday::ResourceNotFound
          raise PassageError,
                PassageError.new(
                  message: "Passage User with ID \"#{user_id}\" does not exist",
                  status_code: e.response[:status],
                  body: e.response[:body]
                )
        else
          raise PassageError,
                PassageError.new(
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
        response =
          @connection.patch("/v1/apps/#{@app_id}/users/#{user_id}", updates)
        user = response.body["user"]
        return(
          Passage::User.new(
            id: user["id"],
            status: user["status"],
            email: user["email"],
            phone: user["phone"],
            email_verified: user["email_verified"],
            phone_verified: user["phone_verified"],
            created_at: user["created_at"],
            updated_at: user["updated_at"],
            last_login_at: user["last_login_at"],
            login_count: user["login_count"],
            webauthn: user["webauthn"],
            webauthn_devices: user["webauthn_devices"],
            recent_events: user["recent_events"],
            user_metadata: user["user_metadata"]
          )
        )
      rescue Faraday::Error => e
        if e.is_a? Faraday::ResourceNotFound
          raise PassageError,
                PassageError.new(
                  "passage User with ID \"#{user_id}\" does not exist"
                )
        else
          raise PassageError,
                PassageError.new(
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
        response = @connection.post("/v1/apps/#{@app_id}/users", create)
        user = response.body["user"]
        return(
          Passage::User.new(
            id: user["id"],
            status: user["status"],
            email: user["email"],
            phone: user["phone"],
            email_verified: user["email_verified"],
            phone_verified: user["phone_verified"],
            created_at: user["created_at"],
            updated_at: user["updated_at"],
            last_login_at: user["last_login_at"],
            login_count: user["login_count"],
            webauthn: user["webauthn"],
            webauthn_devices: user["webauthn_devices"],
            recent_events: user["recent_events"],
            user_metadata: user["user_metadata"]
          )
        )
      rescue Faraday::Error => e
        raise PassageError,
              PassageError.new(
                "failed to create Passage User",
                status_code: e.response[:status],
                body: e.response[:body]
              )
      end
    end

    def delete(user_id:)
      user_exists?(user_id)

      begin
        response = @connection.delete("/v1/apps/#{@app_id}/users/#{user_id}")
        return true
      rescue Faraday::Error => e
        if e.is_a? Faraday::ResourceNotFound
          raise PassageError,
                PassageError.new(
                  "passage User with ID \"#{user_id}\" does not exist",
                  status_code: e.response[:status],
                  body: e.response[:body]
                )
        else
          raise PassageError,
                PassageError.new(
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
        response =
          @connection.delete(
            "/v1/apps/#{@app_id}/users/#{user_id}/devices/#{device_id}"
          )
        return true
      rescue Faraday::Error => e
        raise PassageError,
              PassageError.new(
                "failed to delete Passage User Device",
                status_code: e.response[:status],
                body: e.response[:body]
              )
      end
    end

    def list_devices(user_id:)
      user_exists?(user_id)

      begin
        response =
          @connection.get("/v1/apps/#{@app_id}/users/#{user_id}/devices")
        devicesResp = response.body["devices"]
        devices = Array.new
        devicesResp.each do |device|
          devices.append(
            Passage::Device.new(
              id: device["id"],
              cred_id: device["cred_id"],
              friendly_name: device["friendly_name"],
              usage_count: device["usage_count"],
              updated_at: device["updated_at"],
              created_at: device["created_at"],
              last_login_at: device["last_login_at"]
            )
          )
        end
        return devices
      rescue Faraday::Error => e
        raise PassageError,
              PassageError.new(
                "failed to delete Passage User Device",
                status_code: e.response[:status],
                body: e.response[:body]
              )
      end
    end

    def signout(user_id:)
      if user_id.to_s.empty?
        raise PassageError, PassageError.new("must supply a valid user_id")
      end
      begin
        response =
          @connection.delete("/v1/apps/#{@app_id}/users/#{user_id}/tokens/")
        return true
      rescue Faraday::Error => e
        raise PassageError,
              PassageError.new(
                "failed to revoke user's refresh tokens",
                status_code: e.response[:status],
                body: e.response[:body]
              )
      end
    end

    private
    def user_exists?(user_id:)
      if user_id.to_s.empty?
        raise PassageError, PassageError.new("must supply a valid user_id")
      end
    end

    def device_exists?(device_id:)
      if device_id.to_s.empty?
        raise PassageError, "must supply a valid device_id"
      end
    end
  end
end
