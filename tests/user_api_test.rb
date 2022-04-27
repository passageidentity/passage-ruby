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
    
    def test_deactivate_user()
        user = PassageClient.user.deactivate_user(user_id: ENV["USER_ID"])
        assert_equal ENV["USER_ID"], user.id
        assert_equal "inactive", user.status
    end

    def test_activate_user()
        user = PassageClient.user.activate_user(user_id: ENV["USER_ID"])
        assert_equal ENV["USER_ID"], user.id
        assert_equal "active", user.status
    end

    def test_update_user()
        user = PassageClient.user.get_user(user_id: ENV["USER_ID"])
        original_email = user.email
        new_email = "chris+update_test@passage.id"
        user = PassageClient.user.update_user(user_id: ENV["USER_ID"], email: new_email)
        assert_equal ENV["USER_ID"], user.id
        assert_equal new_email, user.email
        user = PassageClient.user.update_user(user_id: ENV["USER_ID"], email: original_email)
        assert_equal ENV["USER_ID"], user.id
        assert_equal original_email, user.email
    end

end