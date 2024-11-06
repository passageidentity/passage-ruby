# OpenapiClient::CreateUserRequest

## Properties

| Name              | Type       | Description                                                                                       | Notes      |
| ----------------- | ---------- | ------------------------------------------------------------------------------------------------- | ---------- |
| **email**         | **String** | Email of the new user. Either this or &#x60;phone&#x60; is required; both may be provided.        | [optional] |
| **phone**         | **String** | Phone number of the new user. Either this or &#x60;email&#x60; is required; both may be provided. | [optional] |
| **user_metadata** | **Object** |                                                                                                   | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::CreateUserRequest.new(
  email: null,
  phone: null,
  user_metadata: null
)
```
