# frozen_string_literal: true

require_relative '../lib/passageidentity/error'
require 'test/unit'
require 'net/http'

# This is a test suite for the PassageError class using the Test::Unit framework.
class ErrorTest < Test::Unit::TestCase
  def test_initialize
    body = { 'error' => 'some error' }

    error =
      Passage::PassageError.new(
        message: 'some message',
        status_code: 400,
        body: body
      )

    assert_equal error.message, 'some message'
    assert_equal error.error, 'some error'
    assert_equal error.status_code, 400
    assert_equal error.status_text, Net::HTTPBadRequest
  end

  def test_initialize_message_only
    error = Passage::PassageError.new(message: 'some message')

    assert_equal error.message, 'some message'
    assert_equal error.error, nil
    assert_equal error.status_code, nil
    assert_equal error.status_text, nil
  end
end
