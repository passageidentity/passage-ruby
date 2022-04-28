require_relative '../lib/passageidentity/client'
require_relative './environment'
require 'faraday'
require 'test/unit'

class TestUserAPI < Test::Unit::TestCase
  PassageClient =
    Passage::Client.new(app_id: ENV['APP_ID'], api_key: ENV['API_KEY'])

  def test_create_magi_link()
    magic_link =
      PassageClient.create_magic_link(
        email: 'chris@passage.id',
        channel: Passage::EMAIL_CHANNEL,
        ttl: 12
      )
    assert_equal 12, magic_link.ttl
    assert_equal 'chris@passage.id', magic_link.identifier
  end
end
