require_relative '../lib/passageidentity/client'
require_relative './environment'
require 'faraday'
require 'test/unit'

class TestUserAPI < Test::Unit::TestCase


    PassageClient = Passage::Client.new(app_id: ENV["APP_ID"], api_key: ENV["API_KEY"])
    
    def setup()
        $global_test_user = PassageClient.user.create_user(email: "chris+test-ruby@passage.id", user_metadata: {"example1": "cool"})
    end

    def test_create_delete_user()
        user = PassageClient.user.create_user(email: "chris+test-create-delete@passage.id", user_metadata: {"example1": "cool"})
        assert_equal "chris+test-create-delete@passage.id", user.email
        assert_equal "cool", user.user_metadata["example1"]
        deleted = PassageClient.user.delete_user(user_id: user.id)
        assert_equal true, deleted
    end

    def test_get_user()
        user = PassageClient.user.get_user(user_id: $global_test_user.id)
        assert_equal $global_test_user.id, user.id 
    end
    
    def test_deactivate_user()
        user = PassageClient.user.deactivate_user(user_id: $global_test_user.id)
        assert_equal $global_test_user.id, user.id
        assert_equal "inactive", user.status
    end

    def test_activate_user()
        user = PassageClient.user.activate_user(user_id: $global_test_user.id)
        assert_equal $global_test_user.id, user.id
        assert_equal "active", user.status
    end

    def test_update_user()
        new_email = "chris+update_test-ruby@passage.id"
        user = PassageClient.user.update_user(user_id: $global_test_user.id, email: new_email, user_metadata: {"example1": "lame"})
        assert_equal $global_test_user.id, user.id
        assert_equal new_email, user.email
        assert_equal "lame", user.user_metadata["example1"]
    end

    def teardown()
        deleted = PassageClient.user.delete_user(user_id: $global_test_user.id)
    end
end
