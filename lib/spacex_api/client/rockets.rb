# frozen_string_literal: true

module SpacexApi
  class Client
    module Rockets
      def rockets
        get("rockets")
      end

      def get_rocket(id)
        get("rockets/#{id}")
      end

      def query_rockets(body = nil)
        post("rockets/query", body)
      end
    end
  end
end
