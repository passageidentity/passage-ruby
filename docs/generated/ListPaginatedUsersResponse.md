# OpenapiClient::ListPaginatedUsersResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **_links** | [**PaginatedLinks**](PaginatedLinks.md) |  |  |
| **created_before** | **Integer** | time anchor (Unix timestamp) --&gt; all users returned created before this timestamp |  |
| **limit** | **Integer** |  |  |
| **page** | **Integer** |  |  |
| **total_users** | **Integer** | total number of users for a particular query |  |
| **users** | [**Array&lt;ListPaginatedUsersItem&gt;**](ListPaginatedUsersItem.md) |  |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::ListPaginatedUsersResponse.new(
  _links: null,
  created_before: null,
  limit: null,
  page: null,
  total_users: null,
  users: null
)
```

