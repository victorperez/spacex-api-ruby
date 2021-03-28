module SpacexApi
  class Client
    module Payloads
      def payloads
        get("payloads")
      end

      def get_payload(id)
        get("payloads/#{id}")
      end
    end
  end
end
