# Ruby SDK for Passage


## Testing the gem locally

Install the gem
```
gem build passageidentity.gemspec
gem install ./passageidentity-0.0.1.gem
```

Test it out:
```
irb -Ilib -rpassageidentity
>> require 'passageidentity'
=> true
>> passage = Passage::Client.new(app_id: 'YOUR_APP_ID')
>> passage.auth.authenticate("JWT_HERE")
<passage_user_id>
```

To in the example app, change the Gemfile to include this:
```
gem "passageidentity", path: "../../passage-ruby"
```

## Publishing
Create an account in rubygems.org then run the following command with your username.

```
$ curl -u <username> https://rubygems.org/api/v1/api_key.yaml >
~/.gem/credentials; chmod 0600 ~/.gem/credentials

Enter host password for user '<username>':
```

```
gem push passageidentity-0.0.0.gem
```

You can check for the gem here:
```
gem list -r passageidentity
```