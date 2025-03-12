=begin
#Passage Management API

#Passage's management API to manage your Passage apps and users.

The version of the OpenAPI document: 1
Contact: support@passage.id
Generated by: https://openapi-generator.tech
Generator version: 7.11.0

=end

require 'cgi'

module OpenapiClient
  class MagicLinksApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create Embeddable Magic Link
    # Create magic link for a user.
    # @param app_id [String] App ID
    # @param create_magic_link_request [CreateMagicLinkRequest] Request to create a magic link
    # @param [Hash] opts the optional parameters
    # @return [MagicLinkResponse]
    def create_magic_link(app_id, create_magic_link_request, opts = {})
      data, _status_code, _headers = create_magic_link_with_http_info(app_id, create_magic_link_request, opts)
      data
    end

    # Create Embeddable Magic Link
    # Create magic link for a user.
    # @param app_id [String] App ID
    # @param create_magic_link_request [CreateMagicLinkRequest] Request to create a magic link
    # @param [Hash] opts the optional parameters
    # @return [Array<(MagicLinkResponse, Integer, Hash)>] MagicLinkResponse data, response status code and response headers
    def create_magic_link_with_http_info(app_id, create_magic_link_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MagicLinksApi.create_magic_link ...'
      end
      # verify the required parameter 'app_id' is set
      if @api_client.config.client_side_validation && app_id.nil?
        fail ArgumentError, "Missing the required parameter 'app_id' when calling MagicLinksApi.create_magic_link"
      end
      # verify the required parameter 'create_magic_link_request' is set
      if @api_client.config.client_side_validation && create_magic_link_request.nil?
        fail ArgumentError, "Missing the required parameter 'create_magic_link_request' when calling MagicLinksApi.create_magic_link"
      end
      # resource path
      local_var_path = '/apps/{app_id}/magic-links'.sub('{' + 'app_id' + '}', CGI.escape(app_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(create_magic_link_request)

      # return_type
      return_type = opts[:debug_return_type] || 'MagicLinkResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"MagicLinksApi.create_magic_link",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MagicLinksApi#create_magic_link\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
