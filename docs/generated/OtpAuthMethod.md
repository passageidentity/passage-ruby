# OpenapiClient::OtpAuthMethod

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **enabled** | **Boolean** |  |  |
| **ttl** | **Integer** | Maximum time (IN SECONDS) for the auth to expire. | [default to 300] |
| **ttl_display_unit** | [**TtlDisplayUnit**](TtlDisplayUnit.md) |  |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::OtpAuthMethod.new(
  enabled: null,
  ttl: null,
  ttl_display_unit: null
)
```

