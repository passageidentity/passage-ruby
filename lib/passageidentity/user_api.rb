require_relative 'client'

module Passage
  class UserAPI
    # This class will require an API key
    def initialize(connection, app_id, api_key)
      @connection = connection
      @app_id = app_id
      @api_key = api_key
    end

    def get_user(user_id:)
      raise PassageError, 'must supply a valid user_id' if user_id.to_s.empty?
      begin
        response = @connection.get("/v1/apps/#{@app_id}/users/#{user_id}")
        user = response.body['user']
        user.transform_keys(&:to_sym)
        return(
          Passage::User.new(
            user['id'],
            user['status'],
            user['email'],
            user['phone'],
            user['email_verified'],
            user['created_at'],
            user['last_login_at'],
            user['user_metadata']
          )
        )
      rescue Faraday::Error => e
        if e.is_a? Faraday::ResourceNotFound
          raise PassageError,
                "passage User with ID \"#{user_id}\" does not exist"
        else
          raise PassageError,
                "failed to get Passage User. Http Status: #{e.response[:status]}. Response: #{e.response[:body]['error']}"
        end
      end
    end

    def activate_user(user_id:)
      raise PassageError, 'must supply a valid user_id' if user_id.to_s.empty?
      begin
        response =
          @connection.patch("/v1/apps/#{@app_id}/users/#{user_id}/activate")
        user = response.body['user']
        return(
          Passage::User.new(
            user['id'],
            user['status'],
            user['email'],
            user['phone'],
            user['email_verified'],
            user['created_at'],
            user['last_login_at'],
            user['user_metadata']
          )
        )
      rescue Faraday::Error => e
        if e.is_a? Faraday::ResourceNotFound
          raise PassageError,
                "passage User with ID \"#{user_id}\" does not exist"
        else
          raise PassageError,
                "failed to activate Passage User. Http Status: #{e.response[:status]}. Response: #{e.response[:body]['error']}"
        end
      end
    end

    def deactivate_user(user_id:)
      raise PassageError, 'must supply a valid user_id' if user_id.to_s.empty?
      begin
        response =
          @connection.patch("/v1/apps/#{@app_id}/users/#{user_id}/deactivate")
        user = response.body['user']
        return(
          Passage::User.new(
            user['id'],
            user['status'],
            user['email'],
            user['phone'],
            user['email_verified'],
            user['created_at'],
            user['last_login_at'],
            user['user_metadata']
          )
        )
      rescue Faraday::Error => e
        if e.is_a? Faraday::ResourceNotFound
          raise PassageError,
                "passage User with ID \"#{user_id}\" does not exist"
        else
          raise PassageError,
                "failed to deactivate Passage User. Http Status: #{e.response[:status]}. Response: #{e.response[:body]['error']}"
        end
      end
    end

    def update_user(user_id:, email: '', phone: '', user_metadata: {})
      raise PassageError, 'must supply a valid user_id' if user_id.to_s.empty?
      updates = {}
      updates['email'] = email unless email.empty?
      updates['phone'] = phone unless phone.empty?
      updates['user_metadata'] = user_metadata unless user_metadata.empty?
      begin
        response =
          @connection.patch("/v1/apps/#{@app_id}/users/#{user_id}", updates)
        user = response.body['user']
        return(
          Passage::User.new(
            user['id'],
            user['status'],
            user['email'],
            user['phone'],
            user['email_verified'],
            user['created_at'],
            user['last_login_at'],
            user['user_metadata']
          )
        )
      rescue Faraday::Error => e
        if e.is_a? Faraday::ResourceNotFound
          raise PassageError,
                "passage User with ID \"#{user_id}\" does not exist"
        else
          raise PassageError,
                "failed to update Passage User. Http Status: #{e.response[:status]}. Response: #{e.response[:body]['error']}"
        end
      end
    end

    def create_user(email: '', phone: '', user_metadata: {})
      create = {}
      create['email'] = email unless email.empty?
      create['phone'] = phone unless phone.empty?
      create['user_metadata'] = user_metadata unless user_metadata.empty?
      begin
        response = @connection.post("/v1/apps/#{@app_id}/users", create)
        user = response.body['user']
        return(
          Passage::User.new(
            user['id'],
            user['status'],
            user['email'],
            user['phone'],
            user['email_verified'],
            user['created_at'],
            user['last_login_at'],
            user['user_metadata']
          )
        )
      rescue Faraday::Error => e
        raise PassageError,
              "failed to create Passage User. Http Status: #{e.response[:status]}. Response: #{e.response[:body]['error']}"
      end
    end

    def delete_user(user_id:)
      raise PassageError, 'must supply a valid user_id' if user_id.to_s.empty?
      begin
        response = @connection.delete("/v1/apps/#{@app_id}/users/#{user_id}")
        return true
      rescue Faraday::Error => e
        if e.is_a? Faraday::ResourceNotFound
          raise PassageError,
                "passage User with ID \"#{user_id}\" does not exist"
        else
          raise PassageError,
                "failed to delete Passage User. Http Status: #{e.response[:status]}. Response: #{e.response[:body]['error']}"
        end
      end
    end
  end
end
