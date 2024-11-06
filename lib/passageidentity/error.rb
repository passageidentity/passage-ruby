require "net/http"

module Passage
  class PassageError < StandardError
    attr_reader :status_code
    attr_reader :status_text
    attr_reader :message
    attr_reader :error

    def initialize(message, status_code: nil, body: nil)
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
      @error = body.nil? ? nil : body["error"]
    end
  end
end
