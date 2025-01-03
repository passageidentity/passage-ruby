# OpenapiClient::CreateMagicLinkRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel** | [**MagicLinkChannel**](MagicLinkChannel.md) |  | [optional] |
| **email** | **String** |  | [optional] |
| **language** | **String** | language of the email to send (optional) | [optional] |
| **magic_link_path** | **String** | must be a relative url | [optional] |
| **phone** | **String** |  | [optional] |
| **redirect_url** | **String** |  | [optional] |
| **_send** | **Boolean** |  | [optional] |
| **ttl** | **Integer** |  | [optional] |
| **type** | [**MagicLinkType**](MagicLinkType.md) |  | [optional] |
| **user_id** | **String** |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::CreateMagicLinkRequest.new(
  channel: null,
  email: null,
  language: null,
  magic_link_path: null,
  phone: null,
  redirect_url: null,
  _send: null,
  ttl: null,
  type: null,
  user_id: null
)
```

