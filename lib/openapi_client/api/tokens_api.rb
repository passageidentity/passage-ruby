=begin
#Passage Management API

#Passage's management API to manage your Passage apps and users.

The version of the OpenAPI document: 1
Contact: support@passage.id
Generated by: https://openapi-generator.tech
Generator version: 7.13.0-SNAPSHOT

=end

require 'cgi'

module OpenapiClient
  class TokensApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Revokes refresh tokens
    # Revokes all refresh tokens for a user
    # @param app_id [String] App ID
    # @param user_id [String] User ID
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def revoke_user_refresh_tokens(app_id, user_id, opts = {})
      revoke_user_refresh_tokens_with_http_info(app_id, user_id, opts)
      nil
    end

    # Revokes refresh tokens
    # Revokes all refresh tokens for a user
    # @param app_id [String] App ID
    # @param user_id [String] User ID
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def revoke_user_refresh_tokens_with_http_info(app_id, user_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TokensApi.revoke_user_refresh_tokens ...'
      end
      # verify the required parameter 'app_id' is set
      if @api_client.config.client_side_validation && app_id.nil?
        fail ArgumentError, "Missing the required parameter 'app_id' when calling TokensApi.revoke_user_refresh_tokens"
      end
      # verify the required parameter 'user_id' is set
      if @api_client.config.client_side_validation && user_id.nil?
        fail ArgumentError, "Missing the required parameter 'user_id' when calling TokensApi.revoke_user_refresh_tokens"
      end
      # resource path
      local_var_path = '/apps/{app_id}/users/{user_id}/tokens'.sub('{' + 'app_id' + '}', CGI.escape(app_id.to_s)).sub('{' + 'user_id' + '}', CGI.escape(user_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"TokensApi.revoke_user_refresh_tokens",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TokensApi#revoke_user_refresh_tokens\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
