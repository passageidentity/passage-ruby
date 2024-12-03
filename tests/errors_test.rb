# frozen_string_literal: true

require_relative '../lib/passageidentity/error'
require 'test/unit'
require 'net/http'

# This is a test suite for the PassageError class using the Test::Unit framework.
class ErrorTest < Test::Unit::TestCase
  def test_initialize
    body = {
      'error' => 'some error',
      'code' => 400
    }

    error =
      Passage::PassageError.new(
        status_code: 404,
        body: body
      )

    assert_equal error.message, 'some error'
    assert_equal error.error_code, 400
    assert_equal error.status_code, 404
  end
end
