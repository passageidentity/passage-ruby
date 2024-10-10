# OpenapiClient::UserRecentEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **created_at** | **Time** |  |  |
| **completed_at** | **Time** |  |  |
| **id** | **String** |  |  |
| **ip_addr** | **String** |  |  |
| **status** | [**UserEventStatus**](UserEventStatus.md) |  |  |
| **type** | **String** |  |  |
| **user_agent** | **String** | The raw user agent value from the originating device |  |
| **user_agent_display** | **String** | A display-friendly version of the user agent |  |
| **action** | [**UserEventAction**](UserEventAction.md) |  |  |
| **social_login_type** | [**SocialConnectionType**](SocialConnectionType.md) |  |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::UserRecentEvent.new(
  created_at: null,
  completed_at: null,
  id: null,
  ip_addr: null,
  status: null,
  type: null,
  user_agent: null,
  user_agent_display: null,
  action: null,
  social_login_type: null
)
```

