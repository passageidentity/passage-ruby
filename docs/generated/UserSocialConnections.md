# OpenapiClient::UserSocialConnections

## Properties

| Name       | Type                                                            | Description | Notes      |
| ---------- | --------------------------------------------------------------- | ----------- | ---------- |
| **apple**  | [**AppleUserSocialConnection**](AppleUserSocialConnection.md)   |             | [optional] |
| **github** | [**GithubUserSocialConnection**](GithubUserSocialConnection.md) |             | [optional] |
| **google** | [**GoogleUserSocialConnection**](GoogleUserSocialConnection.md) |             | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::UserSocialConnections.new(
  apple: null,
  github: null,
  google: null
)
```
