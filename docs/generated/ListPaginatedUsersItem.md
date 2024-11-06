# OpenapiClient::ListPaginatedUsersItem

## Properties

| Name               | Type                            | Description | Notes |
| ------------------ | ------------------------------- | ----------- | ----- |
| **created_at**     | **Time**                        |             |       |
| **email**          | **String**                      |             |       |
| **email_verified** | **Boolean**                     |             |       |
| **id**             | **String**                      |             |       |
| **last_login_at**  | **Time**                        |             |       |
| **login_count**    | **Integer**                     |             |       |
| **phone**          | **String**                      |             |       |
| **phone_verified** | **Boolean**                     |             |       |
| **status**         | [**UserStatus**](UserStatus.md) |             |       |
| **updated_at**     | **Time**                        |             |       |
| **user_metadata**  | **Object**                      |             |       |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::ListPaginatedUsersItem.new(
  created_at: null,
  email: null,
  email_verified: null,
  id: null,
  last_login_at: null,
  login_count: null,
  phone: null,
  phone_verified: null,
  status: null,
  updated_at: null,
  user_metadata: null
)
```
