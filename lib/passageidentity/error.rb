# frozen_string_literal: true

require 'net/http'

module Passage
  # PassageError is a custom error class for handling errors in the PassageIdentity gem.
  class PassageError < StandardError
    attr_reader :status_code, :status_text, :message, :error

    def initialize(message:, status_code: nil, body: nil)
      super(message)

      @message = message
      @status_code = status_code
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
