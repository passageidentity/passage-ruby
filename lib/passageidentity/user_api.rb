require_relative 'client'

module Passage
    class UserAPI

        # This class will require an API key
        def initialize(connection, app_id, api_key)
            puts "initializing user class"
            @connection = connection
            @app_id = app_id
            @api_key = api_key
        end

        def get_user(user_id:)
            begin
                response = @connection.get("/v1/apps/#{@app_id}/users/#{user_id}")
                user = response.body["user"]
                return Passage::User.new(user['id'], user['status'], user['email'], user['phone'], user['email_verified'], user['created_at'], user['last_login_at'])
            rescue Faraday::Error => e
                if e.is_a?Faraday::ResourceNotFound
                    raise PassageError, "passage User with ID \"#{user_id}\" does not exist"
                else
                    raise PassageError, "failed to get Passage User"
                end
            end
        end

        def activate_user(user_id:)
            begin
                response = @connection.patch("/v1/apps/#{@app_id}/users/#{user_id}/activate")
                user = response.body["user"]
                return Passage::User.new(user['id'], user['status'], user['email'], user['phone'], user['email_verified'], user['created_at'], user['last_login_at'])
            rescue Faraday::Error => e
                if e.is_a?Faraday::ResourceNotFound
                    raise PassageError, "passage User with ID \"#{user_id}\" does not exist"
                else
                    raise PassageError, "failed to activate Passage User"
                end
            end
        end
        
        def deactivate_user(user_id:)
            begin
                response = @connection.patch("/v1/apps/#{@app_id}/users/#{user_id}/deactivate")
                user = response.body["user"]
                return Passage::User.new(user['id'], user['status'], user['email'], user['phone'], user['email_verified'], user['created_at'], user['last_login_at'])
            rescue Faraday::Error => e
                if e.is_a?Faraday::ResourceNotFound
                    raise PassageError, "passage User with ID \"#{user_id}\" does not exist"
                else
                    raise PassageError, "failed to deactivate Passage User"
                end
            end
        end

        def update_user(user_id:, email: "", phone: "")
            updates = {}
            updates["email"] = email unless email.empty?
            updates["phone"] = phone unless phone.empty?
            begin
                response = @connection.patch("/v1/apps/#{@app_id}/users/#{user_id}", updates)
                user = response.body["user"]
                return Passage::User.new(user['id'], user['status'], user['email'], user['phone'], user['email_verified'], user['created_at'], user['last_login_at'])
            rescue Faraday::Error => e
                if e.is_a?Faraday::ResourceNotFound
                    raise PassageError, "passage User with ID \"#{user_id}\" does not exist"
                else
                    raise PassageError, "failed to deactivate Passage User"
                end
            end
        end

        def delete_user(user_id:)
            begin
                response = @connection.delete("/v1/apps/#{@app_id}/users/#{user_id}")
                return true 
            rescue Faraday::Error => e
                if e.is_a?Faraday::ResourceNotFound
                    raise PassageError, "passage User with ID \"#{user_id}\" does not exist"
                else
                    raise PassageError, "failed to delete Passage User"
                end
            end
        end
    end
end