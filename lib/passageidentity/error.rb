require "net/http"

module Passage
  class PassageError < StandardError
    attr_reader :status_code
    attr_reader :status_text
    attr_reader :message
    attr_reader :error

    def initialize(message:, status_code: nil, body: nil)
      @message = message
      @status_code =  status_code
      @status_text = status_code.nil? ? nil : Net::HTTPResponse::CODE_TO_OBJ[status_code.to_s]
      @error = body.nil? ? nil :  body["error"]
     end
  end
end
