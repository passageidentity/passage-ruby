# OpenapiClient::AppInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **additional_auth_origins** | **Array&lt;String&gt;** |  |  |
| **allowed_callback_urls** | **Array&lt;String&gt;** | The valid URLs where users can be redirected after authentication. |  |
| **allowed_identifier** | **String** |  |  |
| **allowed_logout_urls** | **Array&lt;String&gt;** | The valid URLs where users can be redirected after logging out. |  |
| **application_login_uri** | **String** | A route within your application that redirects to the Authorization URL endpoint. |  |
| **auth_fallback_method** | **String** | Deprecated Property. Please refer to &#x60;auth_methods&#x60; to view settings for individual authentication methods. |  |
| **auth_fallback_method_ttl** | **Integer** | Deprecated Property. Please refer to &#x60;auth_methods&#x60; to view settings for individual authentication methods. |  |
| **auth_methods** | [**AuthMethods**](AuthMethods.md) |  |  |
| **auth_origin** | **String** |  |  |
| **auto_theme_enabled** | **Boolean** |  |  |
| **created_at** | **Time** |  |  |
| **default_language** | **String** |  |  |
| **id** | **String** |  |  |
| **layouts** | [**Layouts**](Layouts.md) |  |  |
| **login_url** | **String** |  |  |
| **light_logo_url** | **String** |  | [optional] |
| **dark_logo_url** | **String** |  | [optional] |
| **name** | **String** |  |  |
| **hosted** | **Boolean** | whether or not the app&#39;s login page hosted by passage |  |
| **hosted_subdomain** | **String** | the subdomain of the app&#39;s hosted login page |  |
| **hosted_theme** | [**ThemeType**](ThemeType.md) |  |  |
| **id_token_lifetime** | **Integer** |  | [optional] |
| **passage_branding** | **Boolean** |  |  |
| **profile_management** | **Boolean** |  |  |
| **public_signup** | **Boolean** |  |  |
| **redirect_url** | **String** |  |  |
| **refresh_absolute_lifetime** | **Integer** |  |  |
| **refresh_enabled** | **Boolean** |  |  |
| **refresh_inactivity_lifetime** | **Integer** |  |  |
| **require_email_verification** | **Boolean** |  |  |
| **require_identifier_verification** | **Boolean** |  |  |
| **required_identifier** | **String** |  |  |
| **role** | **String** |  |  |
| **rsa_public_key** | **String** |  |  |
| **secret** | **String** | can only be retrieved by an app admin | [optional] |
| **session_timeout_length** | **Integer** |  |  |
| **type** | **String** |  |  |
| **user_metadata_schema** | [**Array&lt;UserMetadataField&gt;**](UserMetadataField.md) |  |  |
| **technologies** | [**Array&lt;Technologies&gt;**](Technologies.md) |  |  |
| **element_customization** | [**ElementCustomization**](ElementCustomization.md) |  |  |
| **element_customization_dark** | [**ElementCustomization**](ElementCustomization.md) |  |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AppInfo.new(
  additional_auth_origins: null,
  allowed_callback_urls: null,
  allowed_identifier: null,
  allowed_logout_urls: null,
  application_login_uri: null,
  auth_fallback_method: null,
  auth_fallback_method_ttl: null,
  auth_methods: null,
  auth_origin: null,
  auto_theme_enabled: null,
  created_at: null,
  default_language: null,
  id: null,
  layouts: null,
  login_url: null,
  light_logo_url: null,
  dark_logo_url: null,
  name: null,
  hosted: null,
  hosted_subdomain: null,
  hosted_theme: null,
  id_token_lifetime: null,
  passage_branding: null,
  profile_management: null,
  public_signup: null,
  redirect_url: null,
  refresh_absolute_lifetime: null,
  refresh_enabled: null,
  refresh_inactivity_lifetime: null,
  require_email_verification: null,
  require_identifier_verification: null,
  required_identifier: null,
  role: null,
  rsa_public_key: null,
  secret: null,
  session_timeout_length: null,
  type: null,
  user_metadata_schema: null,
  technologies: null,
  element_customization: null,
  element_customization_dark: null
)
```

