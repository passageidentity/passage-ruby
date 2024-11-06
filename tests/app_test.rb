# frozen_string_literal: true

require_relative '../lib/passageidentity/client'
require 'dotenv'
require 'faraday'
require 'test/unit'

Dotenv.load('.env')
class TestAppAPI < Test::Unit::TestCase
  PassageClient =
    Passage::Client.new(app_id: ENV['APP_ID'], api_key: ENV['API_KEY'])

  def test_get_app
    app = PassageClient.get_app
    assert_equal ENV['APP_ID'], app.id
  end
end
