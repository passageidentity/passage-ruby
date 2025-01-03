# OpenapiClient::UsersApi

All URIs are relative to *https://api.passage.id/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**activate_user**](UsersApi.md#activate_user) | **PATCH** /apps/{app_id}/users/{user_id}/activate | Activate User |
| [**create_user**](UsersApi.md#create_user) | **POST** /apps/{app_id}/users | Create User |
| [**deactivate_user**](UsersApi.md#deactivate_user) | **PATCH** /apps/{app_id}/users/{user_id}/deactivate | Deactivate User |
| [**delete_user**](UsersApi.md#delete_user) | **DELETE** /apps/{app_id}/users/{user_id} | Delete User |
| [**get_user**](UsersApi.md#get_user) | **GET** /apps/{app_id}/users/{user_id} | Get User |
| [**list_paginated_users**](UsersApi.md#list_paginated_users) | **GET** /apps/{app_id}/users | List Users |
| [**update_user**](UsersApi.md#update_user) | **PATCH** /apps/{app_id}/users/{user_id} | Update User |


## activate_user

> <UserResponse> activate_user(app_id, user_id)

Activate User

Activate a user. They will now be able to login.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::UsersApi.new
app_id = 'app_id_example' # String | App ID
user_id = 'user_id_example' # String | User ID

begin
  # Activate User
  result = api_instance.activate_user(app_id, user_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->activate_user: #{e}"
end
```

#### Using the activate_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UserResponse>, Integer, Hash)> activate_user_with_http_info(app_id, user_id)

```ruby
begin
  # Activate User
  data, status_code, headers = api_instance.activate_user_with_http_info(app_id, user_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UserResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->activate_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **app_id** | **String** | App ID |  |
| **user_id** | **String** | User ID |  |

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## create_user

> <UserResponse> create_user(app_id, create_user_args)

Create User

Create user for an application. Must provide an email of phone number identifier.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::UsersApi.new
app_id = 'app_id_example' # String | App ID
create_user_args = OpenapiClient::CreateUserArgs.new # CreateUserArgs | email, phone, user_metadata

begin
  # Create User
  result = api_instance.create_user(app_id, create_user_args)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->create_user: #{e}"
end
```

#### Using the create_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UserResponse>, Integer, Hash)> create_user_with_http_info(app_id, create_user_args)

```ruby
begin
  # Create User
  data, status_code, headers = api_instance.create_user_with_http_info(app_id, create_user_args)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UserResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->create_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **app_id** | **String** | App ID |  |
| **create_user_args** | [**CreateUserArgs**](CreateUserArgs.md) | email, phone, user_metadata |  |

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## deactivate_user

> <UserResponse> deactivate_user(app_id, user_id)

Deactivate User

Deactivate a user. Their account will still exist, but they will not be able to login.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::UsersApi.new
app_id = 'app_id_example' # String | App ID
user_id = 'user_id_example' # String | User ID

begin
  # Deactivate User
  result = api_instance.deactivate_user(app_id, user_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->deactivate_user: #{e}"
end
```

#### Using the deactivate_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UserResponse>, Integer, Hash)> deactivate_user_with_http_info(app_id, user_id)

```ruby
begin
  # Deactivate User
  data, status_code, headers = api_instance.deactivate_user_with_http_info(app_id, user_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UserResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->deactivate_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **app_id** | **String** | App ID |  |
| **user_id** | **String** | User ID |  |

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_user

> delete_user(app_id, user_id)

Delete User

Delete a user.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::UsersApi.new
app_id = 'app_id_example' # String | App ID
user_id = 'user_id_example' # String | User ID

begin
  # Delete User
  api_instance.delete_user(app_id, user_id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->delete_user: #{e}"
end
```

#### Using the delete_user_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_user_with_http_info(app_id, user_id)

```ruby
begin
  # Delete User
  data, status_code, headers = api_instance.delete_user_with_http_info(app_id, user_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->delete_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **app_id** | **String** | App ID |  |
| **user_id** | **String** | User ID |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_user

> <UserResponse> get_user(app_id, user_id)

Get User

Get information about a user.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::UsersApi.new
app_id = 'app_id_example' # String | App ID
user_id = 'user_id_example' # String | User ID

begin
  # Get User
  result = api_instance.get_user(app_id, user_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->get_user: #{e}"
end
```

#### Using the get_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UserResponse>, Integer, Hash)> get_user_with_http_info(app_id, user_id)

```ruby
begin
  # Get User
  data, status_code, headers = api_instance.get_user_with_http_info(app_id, user_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UserResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->get_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **app_id** | **String** | App ID |  |
| **user_id** | **String** | User ID |  |

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_paginated_users

> <ListPaginatedUsersResponse> list_paginated_users(app_id, opts)

List Users

List users for an app.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::UsersApi.new
app_id = 'app_id_example' # String | App ID
opts = {
  page: 56, # Integer | page to fetch (min=1)
  limit: 56, # Integer | number of users to fetch per page (max=500)
  created_before: 56, # Integer | Unix timestamp to anchor pagination results (fetches events that were created before the timestamp)
  order_by: 'order_by_example', # String | Comma separated list of <field>:<ASC/DESC> (example: order_by=id:DESC,created_at:ASC) **cannot order_by `identifier`
  identifier: 'identifier_example', # String | search users email OR phone (pagination prepended operators identifier=<val>, identifier=<ne:val>, identifier=<gt:val>, identifier=<lt:val>, identifier=<like:val>, identifier=<not_like:val>)
  id: 'id_example', # String | search users id (pagination prepended operators id=<val>, id=<ne:val>, id=<gt:val>, id=<lt:val>, id=<like:val>, id=<not_like:val>)
  login_count: 56, # Integer | search users login_count (pagination prepended operators login_count=<val>, login_count=<ne:val>, login_count=<gt:val>, login_count=<lt:val>)
  status: 'status_example', # String | search users by status (pagination prepended operators status=<val>, status=<ne:val>, status=<gt:val>, status=<lt:val>, status=<like:val>, status=<not_like:val>) -- valid values: (active, inactive, pending)
  created_at: 'created_at_example', # String | search users created_at (pagination prepended operators created_at=<val>, created_at=<ne:val>, created_at=<gt:val>, created_at=<lt:val> -- valid timestamp in the format: 2006-01-02T15:04:05.000000Z required
  updated_at: 'updated_at_example', # String | search users updated_at (pagination prepended operators updated_at=<val>, updated_at=<ne:val>, updated_at=<gt:val>, updated_at=<lt:val> -- valid timestamp in the format: 2006-01-02T15:04:05.000000Z required
  last_login_at: 'last_login_at_example' # String | search users last_login_at (pagination prepended operators last_login_at=<val>, lat_login_at=<ne:val>, last_login_at=<gt:val>, last_login_at=<lt:val> -- valid timestamp in the format: 2006-01-02T15:04:05.000000Z required
}

begin
  # List Users
  result = api_instance.list_paginated_users(app_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->list_paginated_users: #{e}"
end
```

#### Using the list_paginated_users_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListPaginatedUsersResponse>, Integer, Hash)> list_paginated_users_with_http_info(app_id, opts)

```ruby
begin
  # List Users
  data, status_code, headers = api_instance.list_paginated_users_with_http_info(app_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListPaginatedUsersResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->list_paginated_users_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **app_id** | **String** | App ID |  |
| **page** | **Integer** | page to fetch (min&#x3D;1) | [optional] |
| **limit** | **Integer** | number of users to fetch per page (max&#x3D;500) | [optional] |
| **created_before** | **Integer** | Unix timestamp to anchor pagination results (fetches events that were created before the timestamp) | [optional] |
| **order_by** | **String** | Comma separated list of &lt;field&gt;:&lt;ASC/DESC&gt; (example: order_by&#x3D;id:DESC,created_at:ASC) **cannot order_by &#x60;identifier&#x60; | [optional] |
| **identifier** | **String** | search users email OR phone (pagination prepended operators identifier&#x3D;&lt;val&gt;, identifier&#x3D;&lt;ne:val&gt;, identifier&#x3D;&lt;gt:val&gt;, identifier&#x3D;&lt;lt:val&gt;, identifier&#x3D;&lt;like:val&gt;, identifier&#x3D;&lt;not_like:val&gt;) | [optional] |
| **id** | **String** | search users id (pagination prepended operators id&#x3D;&lt;val&gt;, id&#x3D;&lt;ne:val&gt;, id&#x3D;&lt;gt:val&gt;, id&#x3D;&lt;lt:val&gt;, id&#x3D;&lt;like:val&gt;, id&#x3D;&lt;not_like:val&gt;) | [optional] |
| **login_count** | **Integer** | search users login_count (pagination prepended operators login_count&#x3D;&lt;val&gt;, login_count&#x3D;&lt;ne:val&gt;, login_count&#x3D;&lt;gt:val&gt;, login_count&#x3D;&lt;lt:val&gt;) | [optional] |
| **status** | **String** | search users by status (pagination prepended operators status&#x3D;&lt;val&gt;, status&#x3D;&lt;ne:val&gt;, status&#x3D;&lt;gt:val&gt;, status&#x3D;&lt;lt:val&gt;, status&#x3D;&lt;like:val&gt;, status&#x3D;&lt;not_like:val&gt;) -- valid values: (active, inactive, pending) | [optional] |
| **created_at** | **String** | search users created_at (pagination prepended operators created_at&#x3D;&lt;val&gt;, created_at&#x3D;&lt;ne:val&gt;, created_at&#x3D;&lt;gt:val&gt;, created_at&#x3D;&lt;lt:val&gt; -- valid timestamp in the format: 2006-01-02T15:04:05.000000Z required | [optional] |
| **updated_at** | **String** | search users updated_at (pagination prepended operators updated_at&#x3D;&lt;val&gt;, updated_at&#x3D;&lt;ne:val&gt;, updated_at&#x3D;&lt;gt:val&gt;, updated_at&#x3D;&lt;lt:val&gt; -- valid timestamp in the format: 2006-01-02T15:04:05.000000Z required | [optional] |
| **last_login_at** | **String** | search users last_login_at (pagination prepended operators last_login_at&#x3D;&lt;val&gt;, lat_login_at&#x3D;&lt;ne:val&gt;, last_login_at&#x3D;&lt;gt:val&gt;, last_login_at&#x3D;&lt;lt:val&gt; -- valid timestamp in the format: 2006-01-02T15:04:05.000000Z required | [optional] |

### Return type

[**ListPaginatedUsersResponse**](ListPaginatedUsersResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_user

> <UserResponse> update_user(app_id, user_id, update_user_args)

Update User

Update a user's information.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::UsersApi.new
app_id = 'app_id_example' # String | App ID
user_id = 'user_id_example' # String | User ID
update_user_args = OpenapiClient::UpdateUserArgs.new # UpdateUserArgs | user settings

begin
  # Update User
  result = api_instance.update_user(app_id, user_id, update_user_args)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->update_user: #{e}"
end
```

#### Using the update_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UserResponse>, Integer, Hash)> update_user_with_http_info(app_id, user_id, update_user_args)

```ruby
begin
  # Update User
  data, status_code, headers = api_instance.update_user_with_http_info(app_id, user_id, update_user_args)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UserResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->update_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **app_id** | **String** | App ID |  |
| **user_id** | **String** | User ID |  |
| **update_user_args** | [**UpdateUserArgs**](UpdateUserArgs.md) | user settings |  |

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

