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
>> passage = Passage::Client.new(app_id: 'YOUR_APP_ID')
>> passage.auth.authenticate("JWT_HERE")
<passage_user_id>
```

Run Tests:

```
# all tests
ruby tests/all.rb
# individual test files
ruby tests/*_test.rb
```

To test in the example app, change the Gemfile to include this path:

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
<<<<<<< HEAD
gem push passage-0.0.0.gem
```

You can check for the gem here:
```
gem list -r passage
```
=======
gem push passageidentity-0.0.0.gem
```

You can check for the gem here:

```
gem list -r passageidentity
```
>>>>>>> 2d0e3f6dc3b40c621c8d16506fa6ab43b0fba673
