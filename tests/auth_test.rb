# frozen_string_literal: true

require_relative '../lib/passageidentity/client'
require 'dotenv'
require 'faraday'
require 'rack'
require 'test/unit'

Dotenv.load('.env')
class TestAuthAPI < Test::Unit::TestCase
  PassageClient =
    Passage::Client.new(app_id: ENV['APP_ID'], api_key: ENV['API_KEY'])
  PassageHeaderClient =
    Passage::Client.new(
      app_id: ENV['APP_ID'],
      api_key: ENV['API_KEY'],
      auth_strategy: Passage::HEADER_STRATEGY
    )

  def test_valid_jwt
    user_id = PassageClient.auth.validate_jwt(ENV['PSG_JWT'])
    assert_equal ENV['TEST_USER_ID'], user_id
  end

  def test_valid_authenticate_token
    user_id = PassageClient.auth.authenticate_token(ENV['PSG_JWT'])
    assert_equal ENV['TEST_USER_ID'], user_id
  end

  def test_invalid_authenticate_token
    assert_raises Passage::PassageError do
      PassageClient.auth.authenticate_token('invalid_token')
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
    envBadCookie = Rack::MockRequest.env_for('https://test.com')
    envBadCookie['HTTP_COOKIE'] = 'psg_auth_token=invalid_token}'
    bad_cookie_request = Rack::Request.new(envBadCookie)
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
end
