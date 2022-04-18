# Ruby SDK for Passage


## Testing the gem locally

Install the gem
```
gem build passage.gemspec
gem install ./passage-0.0.1.gem
```

Test it out:
```
irb -Ilib -rpassage
>> require 'passage'
=> true
>> passage = Passage::Client.new(app_id: 'YOUR_APP_ID')
>> passage.auth.authenticate("JWT_HERE")
<passage_user_id>
```

To in the example app, change the Gemfile to include this:
```
gem "passage", path: "../../passage-ruby"
```

## Publishing
Create an account in rubygems.org then run the following command with your username.

```
$ curl -u <username> https://rubygems.org/api/v1/api_key.yaml >
~/.gem/credentials; chmod 0600 ~/.gem/credentials

Enter host password for user '<username>':
```

```
gem push passage-0.0.0.gem
```

You can check for the gem here:
```
gem list -r passage
```