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
| **user_agent** | **String** |  |  |

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
  user_agent: null
)
```

