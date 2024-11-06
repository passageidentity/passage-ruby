# OpenapiClient::UserInfo

## Properties

| Name                   | Type                                                   | Description                                                     | Notes |
| ---------------------- | ------------------------------------------------------ | --------------------------------------------------------------- | ----- |
| **created_at**         | **Time**                                               |                                                                 |       |
| **email**              | **String**                                             |                                                                 |       |
| **email_verified**     | **Boolean**                                            |                                                                 |       |
| **id**                 | **String**                                             |                                                                 |       |
| **last_login_at**      | **Time**                                               |                                                                 |       |
| **login_count**        | **Integer**                                            |                                                                 |       |
| **phone**              | **String**                                             |                                                                 |       |
| **phone_verified**     | **Boolean**                                            |                                                                 |       |
| **recent_events**      | [**Array&lt;UserRecentEvent&gt;**](UserRecentEvent.md) |                                                                 |       |
| **social_connections** | [**UserSocialConnections**](UserSocialConnections.md)  |                                                                 |       |
| **status**             | [**UserStatus**](UserStatus.md)                        |                                                                 |       |
| **updated_at**         | **Time**                                               |                                                                 |       |
| **user_metadata**      | **Object**                                             |                                                                 |       |
| **webauthn**           | **Boolean**                                            |                                                                 |       |
| **webauthn_devices**   | [**Array&lt;WebAuthnDevices&gt;**](WebAuthnDevices.md) |                                                                 |       |
| **webauthn_types**     | [**Array&lt;WebAuthnType&gt;**](WebAuthnType.md)       | List of credential types that have been used for authentication |       |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::UserInfo.new(
  created_at: null,
  email: null,
  email_verified: null,
  id: null,
  last_login_at: null,
  login_count: null,
  phone: null,
  phone_verified: null,
  recent_events: null,
  social_connections: null,
  status: null,
  updated_at: null,
  user_metadata: null,
  webauthn: null,
  webauthn_devices: null,
  webauthn_types: null
)
```
