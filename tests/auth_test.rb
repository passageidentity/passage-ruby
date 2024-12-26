# frozen_string_literal: true

require_relative '../lib/passageidentity/client'
require 'dotenv'
require 'test/unit'

Dotenv.load('.env')

# This is a test suite for the Passage Auth API using the Test::Unit framework.
class TestAuthAPI < Test::Unit::TestCase
  PassageClient = Passage::Client.new(app_id: ENV['APP_ID'], api_key: ENV['API_KEY'])

  def test_valid_jwt
    user_id = PassageClient.auth.validate_jwt(ENV['PSG_JWT'])
    assert_equal ENV['TEST_USER_ID'], user_id
  end

  def test_invalid_jwt
    assert_raises Passage::PassageError do
      PassageClient.auth.validate_jwt('invalid_token')
    end
  end
end
