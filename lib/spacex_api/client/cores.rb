# frozen_string_literal: true

module SpacexApi
  class Client
    module Cores
      def cores
        get("cores")
      end

      def get_core(id)
        get("cores/#{id}")
      end

      def query_cores(body = nil)
        post("cores/query", body)
      end
    end
  end
end
