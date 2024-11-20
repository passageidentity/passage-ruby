# frozen_string_literal: true

require_relative '../lib/passageidentity/client'
require 'dotenv'
require 'faraday'
require 'test/unit'

Dotenv.load('.env')

# This is a test suite for the Passage User API using the Test::Unit framework.
class TestUserAPI < Test::Unit::TestCase
  PassageClient =
    Passage::Client.new(app_id: ENV['APP_ID'], api_key: ENV['API_KEY'])

  def setup
<<<<<<< HEAD
    $global_test_user =
=======
    @test_user =
>>>>>>> origin/main
      PassageClient.user.create(
        email: 'chris+test-ruby@passage.id',
        user_metadata: {
          example1: 'cool'
        }
      )
  end

  def test_create_delete_user
    user =
      PassageClient.user.create(
        email: 'chris+test-create-delete@passage.id',
        user_metadata: {
          example1: 'cool'
        }
      )
    assert_equal 'chris+test-create-delete@passage.id', user.email
    assert_equal 'cool', user.user_metadata[:example1]
    deleted = PassageClient.user.delete(user_id: user.id)
    assert_equal true, deleted
  end

  def test_get_user
<<<<<<< HEAD
    user = PassageClient.user.get(user_id: $global_test_user.id)
    assert_equal $global_test_user.id, user.id
  end

  def test_get_user_by_identifier
    user = PassageClient.user.get(user_id: $global_test_user.id)
    assert_equal $global_test_user.id, user.id
=======
    user = PassageClient.user.get(user_id: @test_user.id)
    assert_equal @test_user.id, user.id
  end

  def test_get_user_by_identifier
    user = PassageClient.user.get(user_id: @test_user.id)
    assert_equal @test_user.id, user.id
>>>>>>> origin/main

    user_by_identifier = PassageClient.user.get_by_identifier(user_identifier: @test_user.email)
    assert_equal @test_user.id, user_by_identifier.id

    assert_equal user, user_by_identifier
  end

  def test_get_user_by_identifier_upper_case
<<<<<<< HEAD
    user = PassageClient.user.get(user_id: $global_test_user.id)
    assert_equal $global_test_user.id, user.id
=======
    user = PassageClient.user.get(user_id: @test_user.id)
    assert_equal @test_user.id, user.id
>>>>>>> origin/main

    user_by_identifier = PassageClient.user.get_by_identifier(user_identifier: @test_user.email.upcase)
    assert_equal @test_user.id, user_by_identifier.id

    assert_equal user, user_by_identifier
  end

  def test_get_user_by_identifier_phone
<<<<<<< HEAD
    $phone = '+15005550007'
    create_user = PassageClient.user.create(
      phone: $phone
=======
    phone = '+15005550007'
    create_user = PassageClient.user.create(
      phone: phone
>>>>>>> origin/main
    )
    user = PassageClient.user.get(user_id: create_user.id)
    assert_equal create_user.id, user.id

    user_by_identifier = PassageClient.user.get_by_identifier(user_identifier: phone)
    assert_equal create_user.id, user_by_identifier.id

    assert_equal user, user_by_identifier
  end

  def test_invalid_get_user_by_identifier
<<<<<<< HEAD
    user = PassageClient.user.get(user_id: $global_test_user.id)
    assert_equal $global_test_user.id, user.id
=======
    user = PassageClient.user.get(user_id: @test_user.id)
    assert_equal @test_user.id, user.id
>>>>>>> origin/main

    assert_raise Passage::PassageError do
      PassageClient.user.get_by_identifier(user_identifier: 'error@passage.id')
    end
  end

  def test_deactivate_user
<<<<<<< HEAD
    user = PassageClient.user.deactivate(user_id: $global_test_user.id)
    assert_equal $global_test_user.id, user.id
=======
    user = PassageClient.user.deactivate(user_id: @test_user.id)
    assert_equal @test_user.id, user.id
>>>>>>> origin/main
    assert_equal 'inactive', user.status
  end

  def test_activate_user
<<<<<<< HEAD
    user = PassageClient.user.activate(user_id: $global_test_user.id)
    assert_equal $global_test_user.id, user.id
=======
    user = PassageClient.user.activate(user_id: @test_user.id)
    assert_equal @test_user.id, user.id
>>>>>>> origin/main
    assert_equal 'active', user.status
  end

  def test_update_user
    new_email = 'chris+update_test-ruby@passage.id'
    user =
      PassageClient.user.update(
        user_id: @test_user.id,
        email: new_email,
        user_metadata: {
          example1: 'lame'
        }
      )
    assert_equal @test_user.id, user.id
    assert_equal new_email, user.email
    assert_equal 'lame', user.user_metadata[:example1]
  end

  def test_list_devices
<<<<<<< HEAD
    devices = PassageClient.user.list_devices(user_id: $global_test_user.id)
=======
    devices = PassageClient.user.list_devices(user_id: @test_user.id)
>>>>>>> origin/main
    assert_equal [], devices
  end

  def test_signout
<<<<<<< HEAD
    success = PassageClient.user.signout(user_id: $global_test_user.id)
=======
    success = PassageClient.user.signout(user_id: @test_user.id)
>>>>>>> origin/main
    assert_equal true, success
  end

  def teardown
<<<<<<< HEAD
    PassageClient.user.delete(user_id: $global_test_user.id)
=======
    PassageClient.user.delete(user_id: @test_user.id)
>>>>>>> origin/main
  end
end
