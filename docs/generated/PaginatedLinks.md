# OpenapiClient::PaginatedLinks

## Properties

| Name         | Type                | Description | Notes |
| ------------ | ------------------- | ----------- | ----- |
| **first**    | [**Link**](Link.md) |             |       |
| **last**     | [**Link**](Link.md) |             |       |
| **\_next**   | [**Link**](Link.md) |             |       |
| **previous** | [**Link**](Link.md) |             |       |
| **\_self**   | [**Link**](Link.md) |             |       |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PaginatedLinks.new(
  first: null,
  last: null,
  _next: null,
  previous: null,
  _self: null
)
```
