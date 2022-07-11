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
      raise PassageError, "must supply a valid user_id" if user_id.to_s.empty?
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
                "passage User with ID \"#{user_id}\" does not exist"
        else
          raise PassageError,
                "failed to get Passage User. Http Status: #{e.response[:status]}. Response: #{e.response[:body]["error"]}"
        end
      end
    end

    def activate(user_id:)
      raise PassageError, "must supply a valid user_id" if user_id.to_s.empty?
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
                "passage User with ID \"#{user_id}\" does not exist"
        else
          raise PassageError,
                "failed to activate Passage User. Http Status: #{e.response[:status]}. Response: #{e.response[:body]["error"]}"
        end
      end
    end

    def deactivate(user_id:)
      raise PassageError, "must supply a valid user_id" if user_id.to_s.empty?
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
                "passage User with ID \"#{user_id}\" does not exist"
        else
          raise PassageError,
                "failed to deactivate Passage User. Http Status: #{e.response[:status]}. Response: #{e.response[:body]["error"]}"
        end
      end
    end

    def update(user_id:, email: "", phone: "", user_metadata: {})
      raise PassageError, "must supply a valid user_id" if user_id.to_s.empty?
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
                "passage User with ID \"#{user_id}\" does not exist"
        else
          raise PassageError,
                "failed to update Passage User. Http Status: #{e.response[:status]}. Response: #{e.response[:body]["error"]}"
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
              "failed to create Passage User. Http Status: #{e.response[:status]}. Response: #{e.response[:body]["error"]}"
      end
    end

    def delete(user_id:)
      raise PassageError, "must supply a valid user_id" if user_id.to_s.empty?
      begin
        response = @connection.delete("/v1/apps/#{@app_id}/users/#{user_id}")
        return true
      rescue Faraday::Error => e
        if e.is_a? Faraday::ResourceNotFound
          raise PassageError,
                "passage User with ID \"#{user_id}\" does not exist"
        else
          raise PassageError,
                "failed to delete Passage User. Http Status: #{e.response[:status]}. Response: #{e.response[:body]["error"]}"
        end
      end
    end

    def delete_device(user_id:, device_id:)
      raise PassageError, "must supply a valid user_id" if user_id.to_s.empty?
      if device_id.to_s.empty?
        raise PassageError, "must supply a valid device_id"
      end
      begin
        response =
          @connection.delete(
            "/v1/apps/#{@app_id}/users/#{user_id}/devices/#{device_id}"
          )
        return true
      rescue Faraday::Error => e
        raise PassageError,
              "failed to delete Passage User Device. Http Status: #{e.response[:status]}. Response: #{e.response[:body]["error"]}"
      end
    end

    def list_devices(user_id:)
      raise PassageError, "must supply a valid user_id" if user_id.to_s.empty?
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
              last_login_at: device["last_login_at"],
            )
          )
        end
        return devices
      rescue Faraday::Error => e
        raise PassageError,
              "failed to delete Passage User Device. Http Status: #{e.response[:status]}. Response: #{e.response[:body]["error"]}"
      end
    end
  end
end
