# Passage::AuthApi

All URIs are relative to *https://api.passage.id/v1*

| Method | Description |
| ------ | ----------- |
| [**authenticate_request**](AuthApi.md#authenticate_request) |  **Deprecated:** Revokes refresh tokens |
| [**revoke_user_refresh_tokens**](AuthApi.md#revoke_user_refresh_tokens) | Revokes user tokens |
| [**validate_jwt**](AuthApi.md#validate_jwt) |  Validates jwt token


---

## authenticate_request (deprecated)

> authenticate_request(request)

Validates that request has the correct jwt token


### Examples

```ruby
require 'passageidentity'

class ApplicationController < ActionController::Base
    PassageClient = Passage::Client.new(app_id: PASSAGE_APP_ID, api_key: PASSAGE_API_KEY)

  def authorize!
    begin
      request.to_hash()
      @user_id = Passage.auth.authenticate_request(request)
      session[:psg_user_id] = @user_id
    rescue Exception => e
      # unauthorized
      redirect_to "/unauthorized"
    end
  end
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request** | **RequestObject** | request |  |

### Return type

[**UserInfo**](UserInfo.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)


---

## revoke_user_refresh_tokens()

> revoke_user_refresh_tokens(user_id)

Revokes user tokens

### Examples

```ruby
require 'passageidentity'

class ApplicationController < ActionController::Base
    PassageClient = Passage::Client.new(app_id: PASSAGE_APP_ID, api_key: PASSAGE_API_KEY)

  def authorize!
    begin
      revoke = PassageClient.auth.revoke_user_refresh_tokens(USER_ID)
    rescue Exception => e
      # handle exception (user is not authorized)
      # unauthorized
      redirect_to "/unauthorized"
    end
  end
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **user_id** | **string** | user id |  |

### Return type

boolean

### Authorization

[bearerAuth](../README.md#bearerAuth)



---

## validate_jwt

> validate_jwt(token)

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

