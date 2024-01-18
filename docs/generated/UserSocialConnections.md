# OpenapiClient::UserSocialConnections

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **google** | [**GoogleSocialConnection**](GoogleSocialConnection.md) |  | [optional] |
| **github** | [**GithubSocialConnection**](GithubSocialConnection.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::UserSocialConnections.new(
  google: null,
  github: null
)
```

