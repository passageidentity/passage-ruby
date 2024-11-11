# This script is a test suite for the Passage Management API using Test::Unit framework.
# It tests the functionality of the Passage::Client class, specifically the `get_app` method.
#
# The Passage Management API allows you to manage your Passage apps and users.
#
# Contact: support@passage.id
#
# The test suite requires the following environment variables to be set in a .env file:
# - APP_ID: The ID of the Passage app.
# - API_KEY: The API key for accessing the Passage API.
#
# The test suite includes:
# - TestAppAPI: A test case that verifies the `get_app` method of the Passage::Client class.

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
