# frozen_string_literal: true

require 'net/http'

module Passage
  # PassageError is a custom error class for handling errors
  class PassageError < StandardError
    attr_reader :status_code, :message, :error_code

    def initialize(status_code:, body:)
      super

      @status_code = status_code
      @error_code = body['code']
      @message = body['error']
    end
  end
end
