# Ruby SDK for Passage

This Ruby SDK allows for verification of server-side authentication and user management for Ruby applications build with [Passage](https://passage.id).

Install this package using [RubyGems](https://rubygems.org/gems/passageidentity).

```
gem install passageidentity
```

## Instantiating the Passage Class

Initialize the Passage Client as follows:
```ruby
Passage = Passage::Client.new(
    app_id: "YOUR APP ID", 
    api_key: "YOUR APIKEY", 
    auth_strategy: Passage::HEADER_AUTH 
)
```

Passage has three arguments that can be used for initialization: `app_id`, `api_key`, and `auth_strategy`.

- `app_id` is the Passage App ID that specifies which app should be authorized. It has no default value and must to be set upon initialization.
- `api_key` is an API key for the Passage app, which can be generated in the 'App Settings' section of the [Passage Console](https://console.passage.id). It is an optional parameter and not required for authenticating requests. It is required to get or update user information.
- `auth_strategy` defines where the Passage SDK should look for the authentication token. It is set by default to `Passage::COOKIE_AUTH`, but can be changed to `Passage::HEADER_AUTH`.

## Authenticating a Request

To authenticate an HTTP request in a Rails application, you can use the Passage library in a middleware function. You need to provide Passage with your App ID in order to verify the JWTs.

```ruby
require 'passageidentity'


class ApplicationController < ActionController::Base
    PassageClient = Passage::Client.new(app_id: PASSAGE_APP_ID)
    def authorize!
        begin
            user_id = PassageClient.auth.authenticate_request(request)
            # user is authorized 
        rescue Exception => e
            # handle exception (user is not authorized)
        end
    end
end
```

## Retrieve User Info

To retrieve information about a user, you should use the `get_user` method. You will need to use a Passage API key, which can be created in the Passage Console under your Application Settings. This API key grants your web server access to the Passage management APIs to get and update information about users. This API key must be protected and stored in an appropriate secure storage location. It should never be hard-coded in the repository.

```ruby
require 'passageidentity'


class ApplicationController < ActionController::Base
    PassageClient = Passage::Client.new(app_id: PASSAGE_APP_ID, api_key: PASSAGE_API_KEY)
    def authorize!
        begin
            user_id = PassageClient.auth.authenticate_request(request)
            user = PassageClient.user.get_user(user_id: @user_id)
            # user is authorized 
        rescue Exception => e
            # handle exception (user is not authorized)
        end
    end
end
```

The information available in the Passage User struct returned by PassageClient.user.get_user(user_id:):
```ruby
    Struct.new :id,
               :status,
               :email,
               :phone,
               :email_verified,
               :created_at,
               :last_login,
               :user_metadata
```
## Activate/Deactivate User

You can activate or deactivate a user using the Passage SDK. These actions require an API Key and deactivating a user will prevent them from logging into your application
with Passage.

```ruby
require 'passageidentity'

PassageClient = Passage::Client.new(app_id: PASSAGE_APP_ID, api_key: PASSAGE_API_KEY)
    
user = PassageClient.user.deactivate_user(user_id: user_id)
user = PassageClient.user.activate_user(user_id: user_id)
```

## Create User

You can create users using their email address or phone number. Note that their phone number must be in E164 format (example shown below).

```ruby
require 'passageidentity'

PassageClient = Passage::Client.new(app_id: PASSAGE_APP_ID, api_key: PASSAGE_API_KEY)
    
user = PassageClient.user.create_user(email: "exampleEmail@domain.com")
user = PassageClient.user.create_user(phone: "+15005550007")
```

## Delete User

You can delete a user using the Passage SDK.

```ruby
require 'passageidentity'

PassageClient = Passage::Client.new(app_id: PASSAGE_APP_ID, api_key: PASSAGE_API_KEY)
    
success = PassageClient.user.delete_user(user_id: user_id)
if success
    puts "passage user was successfully deleted"
end
```
## Create an Embeddable Magic Link

To create a magic link, you should use the `create_magic_link` method. You can check out our guide on embeddable magic links in our [docs](https://docs.passage.id/popular-guides/smart-links).

```ruby
require 'passageidentity'

PassageClient = Passage::Client.new(app_id: PASSAGE_APP_ID, api_key: PASSAGE_API_KEY)
    
magic_link = PassageClient.create_magic_link(user_id: user_id)
magic_link = PassageClient.create_magic_link(
    email: "example@domain.com", 
    send: true, 
    channel: Passage::EMAIL_CHANNEL, 
    ttl: 120)

```

The information available in the Passage Magic Link struct returned this method is below:

```ruby
    Struct.new :id,
               :secret,
               :activated,
               :user_id,
               :app_id,
               :identifier,
               :type,
               :redirect_url,
               :ttl,
               :url
```

