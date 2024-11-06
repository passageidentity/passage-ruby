# OpenapiClient::AppsApi

All URIs are relative to *https://api.passage.id/v1*

| Method                            | HTTP request           | Description |
| --------------------------------- | ---------------------- | ----------- |
| [**get_app**](AppsApi.md#get_app) | **GET** /apps/{app_id} | Get App     |

## get_app

> <AppResponse> get_app(app_id)

Get App

Get app information.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::AppsApi.new
app_id = 'app_id_example' # String | App ID

begin
  # Get App
  result = api_instance.get_app(app_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AppsApi->get_app: #{e}"
end
```

#### Using the get_app_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AppResponse>, Integer, Hash)> get_app_with_http_info(app_id)

```ruby
begin
  # Get App
  data, status_code, headers = api_instance.get_app_with_http_info(app_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AppResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AppsApi->get_app_with_http_info: #{e}"
end
```

### Parameters

| Name       | Type       | Description | Notes |
| ---------- | ---------- | ----------- | ----- |
| **app_id** | **String** | App ID      |       |

### Return type

[**AppResponse**](AppResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json
