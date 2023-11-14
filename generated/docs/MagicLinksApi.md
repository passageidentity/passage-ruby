# OpenapiClient::MagicLinksApi

All URIs are relative to *https://api.passage.id/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_magic_link**](MagicLinksApi.md#create_magic_link) | **POST** /apps/{app_id}/magic-links | Create Embeddable Magic Link |


## create_magic_link

> <MagicLinkResponse> create_magic_link(app_id, create_magic_link_request)

Create Embeddable Magic Link

Create magic link for a user.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MagicLinksApi.new
app_id = 'app_id_example' # String | App ID
create_magic_link_request = OpenapiClient::CreateMagicLinkRequest.new({channel: OpenapiClient::MagicLinkChannel::EMAIL, email: 'email_example', magic_link_path: 'magic_link_path_example', phone: 'phone_example', redirect_url: 'redirect_url_example', _send: false, ttl: 37, user_id: 'user_id_example'}) # CreateMagicLinkRequest | magic link request

begin
  # Create Embeddable Magic Link
  result = api_instance.create_magic_link(app_id, create_magic_link_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MagicLinksApi->create_magic_link: #{e}"
end
```

#### Using the create_magic_link_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MagicLinkResponse>, Integer, Hash)> create_magic_link_with_http_info(app_id, create_magic_link_request)

```ruby
begin
  # Create Embeddable Magic Link
  data, status_code, headers = api_instance.create_magic_link_with_http_info(app_id, create_magic_link_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MagicLinkResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MagicLinksApi->create_magic_link_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **app_id** | **String** | App ID |  |
| **create_magic_link_request** | [**CreateMagicLinkRequest**](CreateMagicLinkRequest.md) | magic link request |  |

### Return type

[**MagicLinkResponse**](MagicLinkResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

