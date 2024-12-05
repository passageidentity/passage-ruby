# frozen_string_literal: true

require_relative '../lib/passageidentity/client'
require 'dotenv'
require 'faraday'
require 'test/unit'

Dotenv.load('.env')

# This is a test suite for the Passage App API using the Test::Unit framework.
class TestAppAPI < Test::Unit::TestCase
  PassageClient =
    Passage::Client.new(app_id: ENV['APP_ID'], api_key: ENV['API_KEY'])

  def test_get_app
    app = PassageClient.get_app
    assert_equal ENV['APP_ID'], app.id
  end

  def test_create_magic_link
    magic_link =
      PassageClient.create_magic_link(
        email: 'passage@passage.id',
        channel: Passage::EMAIL_CHANNEL,
        ttl: 122
      )

    assert_equal 122, magic_link.ttl
    assert_equal 'passage@passage.id', magic_link.identifier
  end
end
