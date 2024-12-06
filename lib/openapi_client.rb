=begin
#Passage Management API

#Passage's management API to manage your Passage apps and users.

The version of the OpenAPI document: 1
Contact: support@passage.id
Generated by: https://openapi-generator.tech
Generator version: 7.11.0-SNAPSHOT

=end

# Common files
require_relative 'openapi_client/api_client'
require_relative 'openapi_client/api_error'
require_relative 'openapi_client/version'
require_relative 'openapi_client/configuration'

# Models
require_relative 'openapi_client/models/app_info'
require_relative 'openapi_client/models/app_response'
require_relative 'openapi_client/models/apple_user_social_connection'
require_relative 'openapi_client/models/auth_methods'
require_relative 'openapi_client/models/create_magic_link_request'
require_relative 'openapi_client/models/create_user_request'
require_relative 'openapi_client/models/element_customization'
require_relative 'openapi_client/models/font_family'
require_relative 'openapi_client/models/github_user_social_connection'
require_relative 'openapi_client/models/google_user_social_connection'
require_relative 'openapi_client/models/layout_config'
require_relative 'openapi_client/models/layouts'
require_relative 'openapi_client/models/link'
require_relative 'openapi_client/models/list_devices_response'
require_relative 'openapi_client/models/list_paginated_users_item'
require_relative 'openapi_client/models/list_paginated_users_response'
require_relative 'openapi_client/models/magic_link'
require_relative 'openapi_client/models/magic_link_auth_method'
require_relative 'openapi_client/models/magic_link_channel'
require_relative 'openapi_client/models/magic_link_response'
require_relative 'openapi_client/models/magic_link_type'
require_relative 'openapi_client/models/model400_error'
require_relative 'openapi_client/models/model401_error'
require_relative 'openapi_client/models/model403_error'
require_relative 'openapi_client/models/model404_error'
require_relative 'openapi_client/models/model500_error'
require_relative 'openapi_client/models/nonce'
require_relative 'openapi_client/models/otp_auth_method'
require_relative 'openapi_client/models/paginated_links'
require_relative 'openapi_client/models/passkeys_auth_method'
require_relative 'openapi_client/models/social_connection_type'
require_relative 'openapi_client/models/technologies'
require_relative 'openapi_client/models/theme_type'
require_relative 'openapi_client/models/ttl_display_unit'
require_relative 'openapi_client/models/update_user_request'
require_relative 'openapi_client/models/user_event_action'
require_relative 'openapi_client/models/user_event_status'
require_relative 'openapi_client/models/user_info'
require_relative 'openapi_client/models/user_metadata_field'
require_relative 'openapi_client/models/user_metadata_field_type'
require_relative 'openapi_client/models/user_recent_event'
require_relative 'openapi_client/models/user_response'
require_relative 'openapi_client/models/user_social_connections'
require_relative 'openapi_client/models/user_status'
require_relative 'openapi_client/models/web_authn_devices'
require_relative 'openapi_client/models/web_authn_icons'
require_relative 'openapi_client/models/web_authn_type'

# APIs
require_relative 'openapi_client/api/apps_api'
require_relative 'openapi_client/api/magic_links_api'
require_relative 'openapi_client/api/tokens_api'
require_relative 'openapi_client/api/user_devices_api'
require_relative 'openapi_client/api/users_api'

module OpenapiClient
  class << self
    # Customize default settings for the SDK using block.
    #   OpenapiClient.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
