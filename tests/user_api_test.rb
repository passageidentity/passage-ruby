require_relative '../lib/passageidentity/client'
require_relative './environment'
require 'faraday'
require 'test/unit'

class TestUserAPI < Test::Unit::TestCase


    PassageClient = Passage::Client.new(app_id: ENV["APP_ID"], api_key: ENV["API_KEY"])
    def test_get_user()
        user = PassageClient.user.get_user(user_id: ENV["USER_ID"])
        assert_equal ENV["USER_ID"], user.id 
    end
end