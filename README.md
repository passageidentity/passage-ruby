<img src="https://storage.googleapis.com/passage-docs/passage-logo-gradient.svg" alt="Passage logo" style="width:250px;"/>

[![Gem Version](https://badge.fury.io/rb/passageidentity.svg)](https://badge.fury.io/rb/passageidentity)

# passage-ruby

This Ruby SDK allows for verification of server-side authentication and user management for Ruby applications build with [Passage](https://passage.id). For more information, please visit [Passage Documentation](https://docs.passage.id).

Install this package using [RubyGems](https://rubygems.org/gems/passageidentity).

```
gem install passageidentity
```

## Instantiating the Passage Class

Initialize the Passage Client as follows:

```ruby
PassageClient =
  Passage::Client.new(
    app_id: 'YOUR APP ID',
    api_key: 'YOUR APIKEY',
    auth_strategy: Passage::HEADER_AUTH,
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

## Retrieve App Info

To retrieve information about an app , you should use the `get_app` method.

```ruby
require 'passageidentity'

PassageClient =
  Passage::Client.new(app_id: PASSAGE_APP_ID)
app_info = PassageClient.get_app()

```

## Retrieve User Info

To retrieve information about a user, you should use the `get` method. You will need to use a Passage API key, which can be created in the Passage Console under your Application Settings. This API key grants your web server access to the Passage management APIs to get and update information about users. This API key must be protected and stored in an appropriate secure storage location. It should never be hard-coded in the repository.

```ruby
require 'passageidentity'

class ApplicationController < ActionController::Base
  PassageClient =
    Passage::Client.new(app_id: PASSAGE_APP_ID, api_key: PASSAGE_API_KEY)
  def authorize!
    begin
      user_id = PassageClient.auth.authenticate_request(request)
      user = PassageClient.user.get(user_id: @user_id)
      # user is authorized
    rescue Exception => e
      # handle exception (user is not authorized)
    end
  end
end
```

## Retrieve User Info By Identifier

To retrieve information about a user, you can also use the `get_by_identifier` method. You will need to use a Passage API key, which can be created in the Passage Console under your Application Settings. This API key grants your web server access to the Passage management APIs to get and update information about users. This API key must be protected and stored in an appropriate secure storage location. It should never be hard-coded in the repository.

```ruby
require 'passageidentity'

class ApplicationController < ActionController::Base
  PassageClient =
    Passage::Client.new(app_id: PASSAGE_APP_ID, api_key: PASSAGE_API_KEY)
  def authorize!
    begin
      user_id = PassageClient.auth.authenticate_request(request)
      user = PassageClient.user.get_by_identifier(identifier: @identifier)
      # user is authorized
    rescue Exception => e
      # handle exception (user is not authorized)
    end
  end
end
```

## Activate/Deactivate User

You can activate or deactivate a user using the Passage SDK. These actions require an API Key and deactivating a user will prevent them from logging into your application
with Passage.

```ruby
require 'passageidentity'

PassageClient =
  Passage::Client.new(app_id: PASSAGE_APP_ID, api_key: PASSAGE_API_KEY)

user = PassageClient.user.deactivate(user_id: user_id)
user = PassageClient.user.activate(user_id: user_id)
```

## Create User

You can create users using their email address or phone number. Note that their phone number must be in E164 format (example shown below).

```ruby
require 'passageidentity'

PassageClient =
  Passage::Client.new(app_id: PASSAGE_APP_ID, api_key: PASSAGE_API_KEY)

user = PassageClient.user.create(email: 'exampleEmail@domain.com')
user = PassageClient.user.create(phone: '+15005550007')
```

## Delete User

You can delete a user using the Passage SDK.

```ruby
require 'passageidentity'

PassageClient =
  Passage::Client.new(app_id: PASSAGE_APP_ID, api_key: PASSAGE_API_KEY)

success = PassageClient.user.delete(user_id: user_id)
puts 'passage user was successfully deleted' if success
```

## List User Devices

You can list the devices associated with a particular Passage User.

```ruby
require 'passageidentity'

PassageClient =
  Passage::Client.new(app_id: PASSAGE_APP_ID, api_key: PASSAGE_API_KEY)

devices = PassageClient.user.list_devices(user_id: user_id)
```

## List User Devices

You can list the devices associated with a particular Passage User.

```ruby
require 'passageidentity'

PassageClient = Passage::Client.new(app_id: PASSAGE_APP_ID, api_key: PASSAGE_API_KEY)

success = PassageClient.user.delete_device(user_id: user_id, device_id)
if success
    puts "passage user device was successfully deleted"
end
```

## Create an Embeddable Magic Link

To create a magic link, you should use the `create_magic_link` method. You can check out our guide on embeddable magic links in our [docs](https://docs.passage.id/complete/magic-links).

```ruby
require 'passageidentity'

PassageClient =
  Passage::Client.new(app_id: PASSAGE_APP_ID, api_key: PASSAGE_API_KEY)

magic_link = PassageClient.create_magic_link(user_id: user_id)
magic_link =
  PassageClient.create_magic_link(
    email: 'example@domain.com',
    send: true,
    channel: Passage::EMAIL_CHANNEL,
    ttl: 120,
  )
```

## Available Functions

| Class       | Method                                                                       | Description                  |
| ----------- | ---------------------------------------------------------------------------- | ---------------------------- |
| _ClientApi_ | [**get_app**](docs/custom/ClientApi.md#get_app)                              | Get App                      |
| _ClientApi_ | [**create_magic_link**](docs/custom/Passage/ClientApi.md#create_magic_link)  | Create Embeddable Magic Link |
| _AuthApi_   | [**auth.authenticate_request**](docs/custom/AuthApi.md#authenticate_request) | Validates user jwt token     |
| _AuthApi_   | [**auth.validate_jwt**](docs/custom/AuthApi.md#validate_jwt)                 | Validates user jwt token     |
| _UserAPI_   | [**user.delete_device**](docs/custom/UserApi.md#delete_device)               | Delete a device for a user   |
| _UserAPI_   | [**user.list_devices**](docs/custom/UserApi.md#list_devices)                 | List User Devices            |
| _UserAPI_   | [**user.activate**](docs/custom/UserApi.md#activate)                         | Activate User                |
| _UserAPI_   | [**user.create**](docs/custom/UserApi.md#create)                             | Create User                  |
| _UserAPI_   | [**user.deactivate**](docs/custom/UserApi.md#deactivate)                     | Deactivate User              |
| _UserAPI_   | [**user.delete**](docs/custom/UserApi.md#delete)                             | Delete User                  |
| _UserAPI_   | [**user.get**](docs/custom/UserApi.md#get)                                   | Get User                     |
| _UserAPI_   | [**user.update**](docs/custom/UserApi.md#update)                             | Update User                  |
| _UserAPI_   | [**user.signout**](docs/custom/UserApi.md#signout)                           | Signout User                 |
