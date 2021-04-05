# frozen_string_literal: true

module SpacexApi
  class Client
    module Payloads
      def payloads
        get("payloads")
      end

      def get_payload(id)
        get("payloads/#{id}")
      end

      def query_payloads(body = nil)
        post("payloads/query", body)
      end
    end
  end
end
