# Passage::ClientApi

All URIs are relative to *https://api.passage.id/v1*

| Method                                                  | HTTP request                        | Description                  |
| ------------------------------------------------------- | ----------------------------------- | ---------------------------- |
| [**get_app**](ClientApi.md#get_app)                     | **GET** /apps/{app_id}              | Get App                      |
| [**create_magic_link**](ClientApi.md#create_magic_link) | **POST** /apps/{app_id}/magic-links | Create Embeddable Magic Link |

## get_app

> <AppResponse> get_app()

Get App

Get app information.

### Examples

```ruby
PassageClient = Passage::Client.new(app_id: PASSAGE_APP_ID, api_key: PASSAGE_API_KEY)

begin
  # Get App
  result = PassageClient.get_app()
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AppsApi->get_app: #{e}"
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

---

## create_magic_link

> <MagicLinkResponse> create_magic_link(create_magic_link_request)

Create Embeddable Magic Link

Create magic link for a user.

### Examples

```ruby
PassageClient = Passage::Client.new(app_id: PASSAGE_APP_ID, api_key: PASSAGE_API_KEY)

api_instance = PassageClient.create_magic_link()

create_magic_link_request = OpenapiClient::create_magic_link({channel: OpenapiClient::MagicLinkChannel::EMAIL, email: 'email_example', magic_link_path: 'magic_link_path_example', phone: 'phone_example', redirect_url: 'redirect_url_example', _send: false, ttl: 37, user_id: 'user_id_example'}) # CreateMagicLinkRequest | magic link request

begin
  # Create Embeddable Magic Link
  result = PassageClient.create_magic_link.create_magic_link(create_magic_link_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MagicLinksApi->create_magic_link: #{e}"
end
```

#### Using the create_magic_link_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MagicLinkResponse>, Integer, Hash)> create_magic_link_with_http_info(app_id, create_magic_link_request)

### Parameters

| Name                          | Type                                                    | Description        | Notes |
| ----------------------------- | ------------------------------------------------------- | ------------------ | ----- |
| **create_magic_link_request** | [**CreateMagicLinkRequest**](CreateMagicLinkRequest.md) | magic link request |       |

### Return type

[**MagicLinkResponse**](MagicLinkResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json
