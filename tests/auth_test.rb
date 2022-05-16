require_relative "../lib/passageidentity/client"
require "dotenv"
require "faraday"
require "test/unit"

Dotenv.load(".env")
class TestUserAPI < Test::Unit::TestCase
  PassageClient =
    Passage::Client.new(app_id: ENV["APP_ID"], api_key: ENV["API_KEY"])

  def test_authenticate_token
    user_id = PassageClient.auth.authenticate_token(ENV["PSG_JWT"])
    assert_equal ENV["TEST_USER_ID"], user_id
  end
end
