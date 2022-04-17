# frozen_string_literal: true

module Passage
    module Request
      def get_request(path)
        @connection.get(
          path
        ).body
      end
  
      def post_request(path, data)
        @connection.post(
          path,
          data
        ).body
      end
  
      def put_request(path, data)
        @connection.put(
          path,
          data
        ).body
      end
  
      def delete_request(path)
        @connection.delete(
          path
        ).body
      end
  
    end
end