require_relative "../lib/passageidentity/client"
require "dotenv"
require "faraday"
require "test/unit"

Dotenv.load(".env")
class TestMagicLinkAPI < Test::Unit::TestCase
  PassageClient =
    Passage::Client.new(app_id: ENV["APP_ID"], api_key: ENV["API_KEY"])

  def test_create_magic_link()
    magic_link =
      PassageClient.create_magic_link(
        email: "vanessa.burroughs@passage.id",
        channel: Passage::EMAIL_CHANNEL,
        ttl: 12
      )

    assert_equal 12, magic_link.ttl
    assert_equal "vanessa.burroughs@passage.id", magic_link.identifier
  end
end
