=begin
#Passage Management API

#Passage's management API to manage your Passage apps and users.

The version of the OpenAPI document: 1
Contact: support@passage.id
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 7.1.0

=end

require 'cgi'

module OpenapiClient
  class UsersApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Activate User
    # Activate a user. They will now be able to login.
    # @param app_id [String] App ID
    # @param user_id [String] User ID
    # @param [Hash] opts the optional parameters
    # @return [UserResponse]
    def activate_user(app_id, user_id, opts = {})
      data, _status_code, _headers = activate_user_with_http_info(app_id, user_id, opts)
      data
    end

    # Activate User
    # Activate a user. They will now be able to login.
    # @param app_id [String] App ID
    # @param user_id [String] User ID
    # @param [Hash] opts the optional parameters
    # @return [Array<(UserResponse, Integer, Hash)>] UserResponse data, response status code and response headers
    def activate_user_with_http_info(app_id, user_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: UsersApi.activate_user ...'
      end
      # verify the required parameter 'app_id' is set
      if @api_client.config.client_side_validation && app_id.nil?
        fail ArgumentError, "Missing the required parameter 'app_id' when calling UsersApi.activate_user"
      end
      # verify the required parameter 'user_id' is set
      if @api_client.config.client_side_validation && user_id.nil?
        fail ArgumentError, "Missing the required parameter 'user_id' when calling UsersApi.activate_user"
      end
      # resource path
      local_var_path = '/apps/{app_id}/users/{user_id}/activate'.sub('{' + 'app_id' + '}', CGI.escape(app_id.to_s)).sub('{' + 'user_id' + '}', CGI.escape(user_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'UserResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"UsersApi.activate_user",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UsersApi#activate_user\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create User
    # Create user for an application. Must provide an email of phone number identifier.
    # @param app_id [String] App ID
    # @param create_user_request [CreateUserRequest] email, phone, user_metadata
    # @param [Hash] opts the optional parameters
    # @return [UserResponse]
    def create_user(app_id, create_user_request, opts = {})
      data, _status_code, _headers = create_user_with_http_info(app_id, create_user_request, opts)
      data
    end

    # Create User
    # Create user for an application. Must provide an email of phone number identifier.
    # @param app_id [String] App ID
    # @param create_user_request [CreateUserRequest] email, phone, user_metadata
    # @param [Hash] opts the optional parameters
    # @return [Array<(UserResponse, Integer, Hash)>] UserResponse data, response status code and response headers
    def create_user_with_http_info(app_id, create_user_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: UsersApi.create_user ...'
      end
      # verify the required parameter 'app_id' is set
      if @api_client.config.client_side_validation && app_id.nil?
        fail ArgumentError, "Missing the required parameter 'app_id' when calling UsersApi.create_user"
      end
      # verify the required parameter 'create_user_request' is set
      if @api_client.config.client_side_validation && create_user_request.nil?
        fail ArgumentError, "Missing the required parameter 'create_user_request' when calling UsersApi.create_user"
      end
      # resource path
      local_var_path = '/apps/{app_id}/users'.sub('{' + 'app_id' + '}', CGI.escape(app_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(create_user_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UserResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"UsersApi.create_user",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UsersApi#create_user\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Deactivate User
    # Deactivate a user. Their account will still exist, but they will not be able to login.
    # @param app_id [String] App ID
    # @param user_id [String] User ID
    # @param [Hash] opts the optional parameters
    # @return [UserResponse]
    def deactivate_user(app_id, user_id, opts = {})
      data, _status_code, _headers = deactivate_user_with_http_info(app_id, user_id, opts)
      data
    end

    # Deactivate User
    # Deactivate a user. Their account will still exist, but they will not be able to login.
    # @param app_id [String] App ID
    # @param user_id [String] User ID
    # @param [Hash] opts the optional parameters
    # @return [Array<(UserResponse, Integer, Hash)>] UserResponse data, response status code and response headers
    def deactivate_user_with_http_info(app_id, user_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: UsersApi.deactivate_user ...'
      end
      # verify the required parameter 'app_id' is set
      if @api_client.config.client_side_validation && app_id.nil?
        fail ArgumentError, "Missing the required parameter 'app_id' when calling UsersApi.deactivate_user"
      end
      # verify the required parameter 'user_id' is set
      if @api_client.config.client_side_validation && user_id.nil?
        fail ArgumentError, "Missing the required parameter 'user_id' when calling UsersApi.deactivate_user"
      end
      # resource path
      local_var_path = '/apps/{app_id}/users/{user_id}/deactivate'.sub('{' + 'app_id' + '}', CGI.escape(app_id.to_s)).sub('{' + 'user_id' + '}', CGI.escape(user_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'UserResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"UsersApi.deactivate_user",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UsersApi#deactivate_user\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete User
    # Delete a user.
    # @param app_id [String] App ID
    # @param user_id [String] User ID
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_user(app_id, user_id, opts = {})
      delete_user_with_http_info(app_id, user_id, opts)
      nil
    end

    # Delete User
    # Delete a user.
    # @param app_id [String] App ID
    # @param user_id [String] User ID
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_user_with_http_info(app_id, user_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: UsersApi.delete_user ...'
      end
      # verify the required parameter 'app_id' is set
      if @api_client.config.client_side_validation && app_id.nil?
        fail ArgumentError, "Missing the required parameter 'app_id' when calling UsersApi.delete_user"
      end
      # verify the required parameter 'user_id' is set
      if @api_client.config.client_side_validation && user_id.nil?
        fail ArgumentError, "Missing the required parameter 'user_id' when calling UsersApi.delete_user"
      end
      # resource path
      local_var_path = '/apps/{app_id}/users/{user_id}'.sub('{' + 'app_id' + '}', CGI.escape(app_id.to_s)).sub('{' + 'user_id' + '}', CGI.escape(user_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"UsersApi.delete_user",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UsersApi#delete_user\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get User
    # Get information about a user.
    # @param app_id [String] App ID
    # @param user_id [String] User ID
    # @param [Hash] opts the optional parameters
    # @return [UserResponse]
    def get_user(app_id, user_id, opts = {})
      data, _status_code, _headers = get_user_with_http_info(app_id, user_id, opts)
      data
    end

    # Get User
    # Get information about a user.
    # @param app_id [String] App ID
    # @param user_id [String] User ID
    # @param [Hash] opts the optional parameters
    # @return [Array<(UserResponse, Integer, Hash)>] UserResponse data, response status code and response headers
    def get_user_with_http_info(app_id, user_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: UsersApi.get_user ...'
      end
      # verify the required parameter 'app_id' is set
      if @api_client.config.client_side_validation && app_id.nil?
        fail ArgumentError, "Missing the required parameter 'app_id' when calling UsersApi.get_user"
      end
      # verify the required parameter 'user_id' is set
      if @api_client.config.client_side_validation && user_id.nil?
        fail ArgumentError, "Missing the required parameter 'user_id' when calling UsersApi.get_user"
      end
      # resource path
      local_var_path = '/apps/{app_id}/users/{user_id}'.sub('{' + 'app_id' + '}', CGI.escape(app_id.to_s)).sub('{' + 'user_id' + '}', CGI.escape(user_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'UserResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"UsersApi.get_user",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UsersApi#get_user\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update User
    # Update a user's information.
    # @param app_id [String] App ID
    # @param user_id [String] User ID
    # @param update_user_request [UpdateUserRequest] user settings
    # @param [Hash] opts the optional parameters
    # @return [UserResponse]
    def update_user(app_id, user_id, update_user_request, opts = {})
      data, _status_code, _headers = update_user_with_http_info(app_id, user_id, update_user_request, opts)
      data
    end

    # Update User
    # Update a user&#39;s information.
    # @param app_id [String] App ID
    # @param user_id [String] User ID
    # @param update_user_request [UpdateUserRequest] user settings
    # @param [Hash] opts the optional parameters
    # @return [Array<(UserResponse, Integer, Hash)>] UserResponse data, response status code and response headers
    def update_user_with_http_info(app_id, user_id, update_user_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: UsersApi.update_user ...'
      end
      # verify the required parameter 'app_id' is set
      if @api_client.config.client_side_validation && app_id.nil?
        fail ArgumentError, "Missing the required parameter 'app_id' when calling UsersApi.update_user"
      end
      # verify the required parameter 'user_id' is set
      if @api_client.config.client_side_validation && user_id.nil?
        fail ArgumentError, "Missing the required parameter 'user_id' when calling UsersApi.update_user"
      end
      # verify the required parameter 'update_user_request' is set
      if @api_client.config.client_side_validation && update_user_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_user_request' when calling UsersApi.update_user"
      end
      # resource path
      local_var_path = '/apps/{app_id}/users/{user_id}'.sub('{' + 'app_id' + '}', CGI.escape(app_id.to_s)).sub('{' + 'user_id' + '}', CGI.escape(user_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_user_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UserResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"UsersApi.update_user",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UsersApi#update_user\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
