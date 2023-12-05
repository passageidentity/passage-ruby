# Passage::AuthApi

All URIs are relative to *https://api.passage.id/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**revoke_user_refresh_tokens**](TokensApi.md#revoke_user_refresh_tokens) | **DELETE** /apps/{app_id}/users/{user_id}/tokens | **Deprecated:** Revokes refresh tokens |


## revoke_user_refresh_tokens

> revoke_user_refresh_tokens(user_id)

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
        revoke = PassageClient.auth.revoke_user_refresh_tokens(USER_ID)
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

---

| Method | Description |
| ------ | ----------- |
| [**validate_jwt**](TokensApi.md#validate_jwt) | Validates jwt token |


## validate_jwt

> validate_jwt(token)

Validates jwt token

Validates jwt token for a user

### Examples

```ruby
require 'passageidentity'

class ApplicationController < ActionController::Base
    PassageClient = Passage::Client.new(app_id: PASSAGE_APP_ID, api_key: PASSAGE_API_KEY)

  def validate_passage_user!
    begin
        # tokens are revoked
        revoke = PassageClient.auth.validate_jwt(token)
    rescue Exception => e
        # handle exception (user is not authorized)
    end
  end
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **token** | **String** | jwt token |  |

### Return type

[**UserInfo**](UserInfo.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

