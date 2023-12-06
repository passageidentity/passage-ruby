# OpenapiClient::AuthMethods

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **passkeys** | [**PasskeysAuthMethod**](PasskeysAuthMethod.md) |  |  |
| **otp** | [**OtpAuthMethod**](OtpAuthMethod.md) |  |  |
| **magic_link** | [**MagicLinkAuthMethod**](MagicLinkAuthMethod.md) |  |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AuthMethods.new(
  passkeys: null,
  otp: null,
  magic_link: null
)
```

