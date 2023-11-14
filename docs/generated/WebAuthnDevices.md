# OpenapiClient::WebAuthnDevices

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **created_at** | **Time** | The first time this webAuthn device was used to authenticate the user |  |
| **cred_id** | **String** | The CredID for this webAuthn device |  |
| **friendly_name** | **String** | The friendly name for the webAuthn device used to authenticate |  |
| **id** | **String** | The ID of the webAuthn device used for authentication |  |
| **last_login_at** | **Time** | The last time this webAuthn device was used to authenticate the user |  |
| **type** | [**WebAuthnType**](WebAuthnType.md) |  |  |
| **updated_at** | **Time** | The last time this webAuthn device was updated |  |
| **usage_count** | **Integer** | How many times this webAuthn device has been used to authenticate the user |  |
| **icons** | [**WebAuthnIcons**](WebAuthnIcons.md) |  |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::WebAuthnDevices.new(
  created_at: null,
  cred_id: null,
  friendly_name: null,
  id: null,
  last_login_at: null,
  type: null,
  updated_at: null,
  usage_count: null,
  icons: null
)
```

