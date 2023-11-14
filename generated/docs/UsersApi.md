# OpenapiClient::UsersApi

All URIs are relative to *https://api.passage.id/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**activate_user**](UsersApi.md#activate_user) | **PATCH** /apps/{app_id}/users/{user_id}/activate | Activate User |
| [**create_user**](UsersApi.md#create_user) | **POST** /apps/{app_id}/users | Create User |
| [**deactivate_user**](UsersApi.md#deactivate_user) | **PATCH** /apps/{app_id}/users/{user_id}/deactivate | Deactivate User |
| [**delete_user**](UsersApi.md#delete_user) | **DELETE** /apps/{app_id}/users/{user_id} | Delete User |
| [**get_user**](UsersApi.md#get_user) | **GET** /apps/{app_id}/users/{user_id} | Get User |
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

> <UserResponse> create_user(app_id, create_user_request)

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
create_user_request = OpenapiClient::CreateUserRequest.new # CreateUserRequest | email, phone, user_metadata

begin
  # Create User
  result = api_instance.create_user(app_id, create_user_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->create_user: #{e}"
end
```

#### Using the create_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UserResponse>, Integer, Hash)> create_user_with_http_info(app_id, create_user_request)

```ruby
begin
  # Create User
  data, status_code, headers = api_instance.create_user_with_http_info(app_id, create_user_request)
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
| **create_user_request** | [**CreateUserRequest**](CreateUserRequest.md) | email, phone, user_metadata |  |

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


## update_user

> <UserResponse> update_user(app_id, user_id, update_user_request)

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
update_user_request = OpenapiClient::UpdateUserRequest.new # UpdateUserRequest | user settings

begin
  # Update User
  result = api_instance.update_user(app_id, user_id, update_user_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->update_user: #{e}"
end
```

#### Using the update_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UserResponse>, Integer, Hash)> update_user_with_http_info(app_id, user_id, update_user_request)

```ruby
begin
  # Update User
  data, status_code, headers = api_instance.update_user_with_http_info(app_id, user_id, update_user_request)
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
| **update_user_request** | [**UpdateUserRequest**](UpdateUserRequest.md) | user settings |  |

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

