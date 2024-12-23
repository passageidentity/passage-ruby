# frozen_string_literal: true

require_relative '../lib/passageidentity/client'
require 'dotenv'
require 'faraday'
require 'test/unit'

Dotenv.load('.env')

# This is a test suite for the Passage User using the Test::Unit framework.
class TestUser < Test::Unit::TestCase
  PassageClient = Passage::Client.new(app_id: ENV['APP_ID'], api_key: ENV['API_KEY'])

  def setup
    args = {
      'email' => 'passage+test-ruby@passage.id',
      'user_metadata' => {
        'example1' => 'cool'
      }
    }
    @test_user = PassageClient.user.create(args: args)
  end

  def test_create_delete_user
    args = {
      'email' => 'passage+test-create-delete@passage.id',
      'user_metadata' => {
        'example1' => 'cool'
      }
    }
    user = PassageClient.user.create(args: args)
    assert_equal 'passage+test-create-delete@passage.id', user.email
    assert_equal 'cool', user.user_metadata[:example1]

    deleted = PassageClient.user.delete(user_id: user.id)
    assert_equal true, deleted
  end

  def test_get_user
    user = PassageClient.user.get(user_id: @test_user.id)
    assert_equal @test_user.id, user.id
  end

  def test_get_user_by_identifier
    user = PassageClient.user.get(user_id: @test_user.id)
    assert_equal @test_user.id, user.id

    user_by_identifier = PassageClient.user.get_by_identifier(user_identifier: @test_user.email)
    assert_equal @test_user.id, user_by_identifier.id

    assert_equal user, user_by_identifier
  end

  def test_get_user_by_identifier_upper_case
    user = PassageClient.user.get(user_id: @test_user.id)
    assert_equal @test_user.id, user.id

    user_by_identifier = PassageClient.user.get_by_identifier(user_identifier: @test_user.email.upcase)
    assert_equal @test_user.id, user_by_identifier.id

    assert_equal user, user_by_identifier
  end

  def test_get_user_by_identifier_phone
    phone = '+15005550007'
    args = {
      'phone' => phone
    }
    create_user = PassageClient.user.create(args: args)
    user = PassageClient.user.get(user_id: create_user.id)
    assert_equal create_user.id, user.id

    user_by_identifier = PassageClient.user.get_by_identifier(user_identifier: phone)
    assert_equal create_user.id, user_by_identifier.id

    assert_equal user, user_by_identifier
  end

  def test_invalid_get_by_identifier
    user = PassageClient.user.get(user_id: @test_user.id)
    assert_equal @test_user.id, user.id

    assert_raise Passage::PassageError do
      PassageClient.user.get_by_identifier(user_identifier: 'error@passage.id')
    end
  end

  def test_deactivate_user
    user = PassageClient.user.deactivate(user_id: @test_user.id)
    assert_equal @test_user.id, user.id
    assert_equal 'inactive', user.status
  end

  def test_activate_user
    user = PassageClient.user.activate(user_id: @test_user.id)
    assert_equal @test_user.id, user.id
    assert_equal 'active', user.status
  end

  def test_update_user
    new_email = 'passage+update_test-ruby@passage.id'
    opts = {
      'email' => new_email,
      'user_metadata' => {
        'example1' => 'lame'
      }
    }
    user = PassageClient.user.update(user_id: @test_user.id, options: opts)
    assert_equal @test_user.id, user.id
    assert_equal new_email, user.email
    assert_equal 'lame', user.user_metadata[:example1]
  end

  def test_list_devices
    devices = PassageClient.user.list_devices(user_id: @test_user.id)
    assert_equal [], devices
  end

  def teardown
    PassageClient.user.delete(user_id: @test_user.id)
  end
end
