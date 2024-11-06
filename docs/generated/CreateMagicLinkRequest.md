# OpenapiClient::CreateMagicLinkRequest

## Properties

| Name                | Type                                        | Description                              | Notes      |
| ------------------- | ------------------------------------------- | ---------------------------------------- | ---------- |
| **channel**         | [**MagicLinkChannel**](MagicLinkChannel.md) |                                          |            |
| **email**           | **String**                                  |                                          |            |
| **language**        | **String**                                  | language of the email to send (optional) | [optional] |
| **magic_link_path** | **String**                                  |                                          |            |
| **phone**           | **String**                                  |                                          |            |
| **redirect_url**    | **String**                                  |                                          |            |
| **\_send**          | **Boolean**                                 |                                          |            |
| **ttl**             | **Integer**                                 |                                          |            |
| **type**            | [**MagicLinkType**](MagicLinkType.md)       |                                          | [optional] |
| **user_id**         | **String**                                  |                                          |            |

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
