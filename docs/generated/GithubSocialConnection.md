# OpenapiClient::GithubSocialConnection

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **provider_id** | **String** | The external ID of the Social Connection. |  |
| **created_at** | **Time** |  |  |
| **last_login_at** | **Time** |  |  |
| **provider_identifier** | **String** | The email of connected social user. |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::GithubSocialConnection.new(
  provider_id: null,
  created_at: null,
  last_login_at: null,
  provider_identifier: null
)
```

