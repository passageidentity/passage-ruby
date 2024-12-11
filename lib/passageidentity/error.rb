# frozen_string_literal: true

require 'net/http'

module Passage
  # PassageError is a custom error class for handling errors
  class PassageError < StandardError
    attr_reader :status_code, :error_code, :message, :status_text, :error

    def initialize(message: nil, status_code: nil, body: {})
      # Ensure body is a hash
      body = {} if body.nil?

      body = symbolize_keys(body)
      @status_code = status_code
      @error_code = body[:code]
      # Message precedence: explicit message > body error > default message
      @message = determine_message(message, body)
      # Determine status text from status code if available
      @status_text = determine_status_text(status_code)
      # Set error field based on message
      @error = @message

      super(@message)
    end

    private

    def determine_message(message, body)
      return message if message

      return body[:error] if body[:error]

      'Unknown error occurred'
    end

    def determine_status_text(code)
      return nil if code.nil?

      status_code_str = code.to_s
      Net::HTTPResponse::CODE_TO_OBJ[status_code_str]
    rescue StandardError
      nil
    end

    def symbolize_keys(hash)
      hash.transform_keys(&:to_sym)
    end
  end
end
