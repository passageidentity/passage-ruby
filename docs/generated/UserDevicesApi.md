# OpenapiClient::UserDevicesApi

All URIs are relative to *https://api.passage.id/v1*

| Method                                                           | HTTP request                                                  | Description                |
| ---------------------------------------------------------------- | ------------------------------------------------------------- | -------------------------- |
| [**delete_user_devices**](UserDevicesApi.md#delete_user_devices) | **DELETE** /apps/{app_id}/users/{user_id}/devices/{device_id} | Delete a device for a user |
| [**list_user_devices**](UserDevicesApi.md#list_user_devices)     | **GET** /apps/{app_id}/users/{user_id}/devices                | List User Devices          |

## delete_user_devices

> delete_user_devices(app_id, user_id, device_id)

Delete a device for a user

Delete a device for a user.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::UserDevicesApi.new
app_id = 'app_id_example' # String | App ID
user_id = 'user_id_example' # String | User ID
device_id = 'device_id_example' # String | Device ID

begin
  # Delete a device for a user
  api_instance.delete_user_devices(app_id, user_id, device_id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling UserDevicesApi->delete_user_devices: #{e}"
end
```

#### Using the delete_user_devices_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_user_devices_with_http_info(app_id, user_id, device_id)

```ruby
begin
  # Delete a device for a user
  data, status_code, headers = api_instance.delete_user_devices_with_http_info(app_id, user_id, device_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling UserDevicesApi->delete_user_devices_with_http_info: #{e}"
end
```

### Parameters

| Name          | Type       | Description | Notes |
| ------------- | ---------- | ----------- | ----- |
| **app_id**    | **String** | App ID      |       |
| **user_id**   | **String** | User ID     |       |
| **device_id** | **String** | Device ID   |       |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

## list_user_devices

> <ListDevicesResponse> list_user_devices(app_id, user_id)

List User Devices

List user devices.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::UserDevicesApi.new
app_id = 'app_id_example' # String | App ID
user_id = 'user_id_example' # String | User ID

begin
  # List User Devices
  result = api_instance.list_user_devices(app_id, user_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UserDevicesApi->list_user_devices: #{e}"
end
```

#### Using the list_user_devices_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListDevicesResponse>, Integer, Hash)> list_user_devices_with_http_info(app_id, user_id)

```ruby
begin
  # List User Devices
  data, status_code, headers = api_instance.list_user_devices_with_http_info(app_id, user_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListDevicesResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling UserDevicesApi->list_user_devices_with_http_info: #{e}"
end
```

### Parameters

| Name        | Type       | Description | Notes |
| ----------- | ---------- | ----------- | ----- |
| **app_id**  | **String** | App ID      |       |
| **user_id** | **String** | User ID     |       |

### Return type

[**ListDevicesResponse**](ListDevicesResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json
