# frozen_string_literal: true

require_relative '../lib/passageidentity/error'
require 'test/unit'

# This is a test suite for the PassageError class using the Test::Unit framework.
class ErrorTest < Test::Unit::TestCase
  def test_initialize
    body = {
      'error' => 'some error',
      'code' => 'invalid'
    }

    error =
      Passage::PassageError.new(
        status_code: 404,
        body: body
      )

    assert_equal error.message, 'some error'
    assert_equal error.error_code, 'invalid'
    assert_equal error.status_code, 404
  end
end
