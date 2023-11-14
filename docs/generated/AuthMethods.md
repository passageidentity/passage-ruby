# OpenapiClient::AuthMethods

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **passkey** | [**PasskeyAuthMethod**](PasskeyAuthMethod.md) |  |  |
| **otp** | [**EmailSmsAuthMethod**](EmailSmsAuthMethod.md) |  |  |
| **magic_link** | [**EmailSmsAuthMethod**](EmailSmsAuthMethod.md) |  |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AuthMethods.new(
  passkey: null,
  otp: null,
  magic_link: null
)
```

