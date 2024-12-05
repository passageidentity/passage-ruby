# frozen_string_literal: true

require 'net/http'

module Passage
  # PassageError is a custom error class for handling errors
  class PassageError < StandardError
    attr_reader :status_code, :error_code, :message, :status_text, :error

    def initialize(status_code:, body:)
      super

      @status_code = status_code
      @error_code = body['code']
      @message = body['error']
     @status_text =
        (
          if status_code.nil?
            nil
          else
            Net::HTTPResponse::CODE_TO_OBJ[status_code.to_s]
          end
        )
      @error = body.nil? ? nil : body['error']
    end
  end
end
