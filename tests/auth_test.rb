# frozen_string_literal: true

require_relative '../lib/passageidentity/client'
require 'dotenv'
require 'faraday'
require 'rack'
require 'test/unit'

Dotenv.load('.env')

# This is a test suite for the Passage Auth API using the Test::Unit framework.
class TestAuthAPI < Test::Unit::TestCase
  PassageClient =
    Passage::Client.new(app_id: ENV['APP_ID'], api_key: ENV['API_KEY'])
  PassageHeaderClient =
    Passage::Client.new(
      app_id: ENV['APP_ID'],
      api_key: ENV['API_KEY'],
      auth_strategy: Passage::HEADER_STRATEGY
    )

  def setup
    @test_user =
      PassageClient.user.create(
        email: 'passage+test-ruby@passage.id',
        user_metadata: {
          example1: 'cool'
        }
      )
  end

  def test_valid_jwt
    user_id = PassageClient.auth.validate_jwt(ENV['PSG_JWT'])
    assert_equal ENV['TEST_USER_ID'], user_id
  end

  def test_invalid_jwt
    assert_raises Passage::PassageError do
      PassageClient.auth.validate_jwt('invalid_token')
    end
  end

  def test_valid_authenticate_request_cookie
    env = Rack::MockRequest.env_for('https://test.com')
    env['HTTP_COOKIE'] = "psg_auth_token=#{ENV['PSG_JWT']}"
    cookie_request = Rack::Request.new(env)
    user_id = PassageClient.auth.authenticate_request(cookie_request)
    assert_equal ENV['TEST_USER_ID'], user_id
  end

  def test_invalid_authenticate_request_cookie
    env_bad_cookie = Rack::MockRequest.env_for('https://test.com')
    env_bad_cookie['HTTP_COOKIE'] = 'psg_auth_token=invalid_token}'
    bad_cookie_request = Rack::Request.new(env_bad_cookie)
    assert_raises Passage::PassageError do
      PassageClient.auth.authenticate_request(bad_cookie_request)
    end
    no_cookie_request = Rack::Request.new({})
    assert_raises Passage::PassageError do
      PassageClient.auth.authenticate_request(no_cookie_request)
    end
  end

  def test_valid_authenticate_request_header
    headers = { 'Authorization' => "Bearer #{ENV['PSG_JWT']}" }
    header_request = Faraday.new(url: 'https://test.com', headers: headers)
    user_id = PassageHeaderClient.auth.authenticate_request(header_request)
    assert_equal ENV['TEST_USER_ID'], user_id
  end

  def test_invalid_authenticate_request_header
    invalid_headers = { 'Authorization' => 'Bearer invalid_token' }
    no_header_request = Faraday.new(url: 'https://test.com')
    assert_raises Passage::PassageError do
      PassageHeaderClient.auth.authenticate_request(no_header_request)
    end
    Faraday.new(url: 'https://test.com', headers: invalid_headers)
    assert_raises Passage::PassageError do
      PassageHeaderClient.auth.authenticate_request(no_header_request)
    end
  end

  def test_create_magic_link
    magic_link =
      PassageClient.auth.create_magic_link(
        email: 'passage@passage.id',
        channel: Passage::EMAIL_CHANNEL,
        ttl: 122
      )

    assert_equal 122, magic_link.ttl
    assert_equal 'passage@passage.id', magic_link.identifier
  end

  def test_invalid_create_magic_link
    assert_raises Passage::PassageError do
      PassageClient.auth.create_magic_link(
        email: 'passage@passage.id',
        ttl: 122
      )
    end
  end

  def test_revoke_user_refresh_tokens
    success = PassageClient.auth.revoke_user_refresh_tokens(@test_user.id)
    assert_equal nil, success
  end

  def teardown
    PassageClient.user.delete(user_id: @test_user.id)
  end
end
