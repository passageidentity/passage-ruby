# OpenapiClient::TokensApi

All URIs are relative to *https://api.passage.id/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**revoke_user_refresh_tokens**](TokensApi.md#revoke_user_refresh_tokens) | **DELETE** /apps/{app_id}/users/{user_id}/tokens | Revokes refresh tokens |


## revoke_user_refresh_tokens

> revoke_user_refresh_tokens(app_id, user_id)

Revokes refresh tokens

Revokes all refresh tokens for a user

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::TokensApi.new
app_id = 'app_id_example' # String | App ID
user_id = 'user_id_example' # String | User ID

begin
  # Revokes refresh tokens
  api_instance.revoke_user_refresh_tokens(app_id, user_id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling TokensApi->revoke_user_refresh_tokens: #{e}"
end
```

#### Using the revoke_user_refresh_tokens_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> revoke_user_refresh_tokens_with_http_info(app_id, user_id)

```ruby
begin
  # Revokes refresh tokens
  data, status_code, headers = api_instance.revoke_user_refresh_tokens_with_http_info(app_id, user_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling TokensApi->revoke_user_refresh_tokens_with_http_info: #{e}"
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

