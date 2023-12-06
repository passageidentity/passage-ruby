# Passage::UsersApi

All URIs are relative to *https://api.passage.id/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**activate**](UsersApi.md#activate) | **PATCH** /apps/{app_id}/users/{user_id}/activate | Activate User |
| [**create**](UsersApi.md#create) | **POST** /apps/{app_id}/users | Create User |
| [**deactivate**](UsersApi.md#deactivate) | **PATCH** /apps/{app_id}/users/{user_id}/deactivate | Deactivate User |
| [**delete**](UsersApi.md#delete) | **DELETE** /apps/{app_id}/users/{user_id} | Delete User |
| [**get**](UsersApi.md#get) | **GET** /apps/{app_id}/users/{user_id} | Get User |
| [**update**](UsersApi.md#update) | **PATCH** /apps/{app_id}/users/{user_id} | Update User |
| [**delete_device**](UsersApi.md#delete_device) | **DELETE** /apps/{app_id}/users/{user_id}/devices/{device_id} | Delete a device for a user |
| [**list_devices**](UsersApi.md#list_devices) | **GET** /apps/{app_id}/users/{user_id}/devices | List User Devices |
| [**signout**](UsersApi.md#signout) | DELETE /apps/{app_id}/users/{user_id}/tokens | Signout of user |


## activate

> <UserResponse> activate(user_id)

Activate User

Activate a user. They will now be able to login.

### Examples

```ruby
api_instance = Passage::UsersApi.new
user_id = 'user_id_example' # String | User ID

begin
  # Activate User
  result = api_instance.user.activate(user_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->activate: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **user_id** | **String** | User ID |  |

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

---

## create

> <UserResponse> create(create_user_request)

Create User

Create user for an application. Must provide an email of phone number identifier.

### Examples

```ruby
api_instance = Passage::UsersApi.new
create_user_request = OpenapiClient::CreateUserRequest.new # CreateUserRequest | email, phone, user_metadata

begin
  # Create User
  result = api_instance.user.create(create_user_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->create: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_user_request** | [**CreateUserRequest**](CreateUserRequest.md) | email, phone, user_metadata |  |

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

---

## deactivate

> <UserResponse> deactivate(user_id)

Deactivate User

Deactivate a user. Their account will still exist, but they will not be able to login.

### Examples

```ruby
api_instance = Passage::UsersApi.new
user_id = 'user_id_example' # String | User ID

begin
  # Deactivate User
  result = api_instance.user.deactivate(user_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->deactivate: #{e}"
end
```


### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **user_id** | **String** | User ID |  |

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

---

## delete

> delete(user_id)

Delete User

Delete a user.

### Examples

```ruby
api_instance = Passage::UsersApi.new
user_id = 'user_id_example' # String | User ID

begin
  # Delete User
  api_instance.user.delete(user_id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->delete: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **user_id** | **String** | User ID |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

---

## get

> <UserResponse> get(user_id)

Get User

Get information about a user.

### Examples

```ruby
api_instance = Passage::UsersApi.new
user_id = 'user_id_example' # String | User ID

begin
  # Get User
  result = api_instance.user.get(user_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->get: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **user_id** | **String** | User ID |  |

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

---

## update

> <UserResponse> update(user_id, update_user_request)

Update User

Update a user's information.

### Examples

```ruby
api_instance = Passage::UsersApi.new
user_id = 'user_id_example' # String | User ID
update_user_request = OpenapiClient::UpdateUserRequest.new # UpdateUserRequest | user settings

begin
  # Update User
  result = api_instance.user.update(user_id, update_user_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->update: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **user_id** | **String** | User ID |  |
| **update_user_request** | [**UpdateUserRequest**](UpdateUserRequest.md) | user settings |  |

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

---

## delete_device

> delete_device(user_id, device_id)

Delete a device for a user

Delete a device for a user.

### Examples

```ruby
api_instance = Passage::UserDevicesApi.new
user_id = 'user_id_example' # String | User ID
device_id = 'device_id_example' # String | Device ID

begin
  # Delete a device for a user
  api_instance.user.delete_device(user_id, device_id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling UserDevicesApi->delete_device: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **user_id** | **String** | User ID |  |
| **device_id** | **String** | Device ID |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


---

## list_devices

> <ListDevicesResponse> list_devices(user_id)

List User Devices

List user devices.

### Examples

```ruby
api_instance = Passage::UserDevicesApi.new
user_id = 'user_id_example' # String | User ID

begin
  # List User Devices
  result = api_instance.user.list_devices(user_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UserDevicesApi->list_devices: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **user_id** | **String** | User ID |  |

### Return type

[**ListDevicesResponse**](ListDevicesResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

---

## signout

> signout(user_id)

Revokes refresh tokens

Revokes all refresh tokens for a user

### Examples

```ruby
require 'passageidentity'

class ApplicationController < ActionController::Base
    PassageClient = Passage::Client.new(app_id: PASSAGE_APP_ID, api_key: PASSAGE_API_KEY)

  def revoke_passage_user_tokens!
    begin
        # tokens are revoked
        revoke = PassageClient.auth.signout(USER_ID)
    rescue Exception => e
        # handle exception (user is not authorized)
    end
  end
end
```


### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **user_id** | **String** | User ID |  |

### Return type

bool

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json
