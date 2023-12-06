# OpenapiClient::UpdateOtpAuthMethod

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **enabled** | **Boolean** |  | [optional] |
| **ttl** | **Integer** | Maximum time (IN SECONDS) for the auth to expire. | [optional][default to 300] |
| **ttl_display_unit** | [**TtlDisplayUnit**](TtlDisplayUnit.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::UpdateOtpAuthMethod.new(
  enabled: null,
  ttl: null,
  ttl_display_unit: null
)
```

