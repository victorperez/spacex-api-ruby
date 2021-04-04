module SpacexApi
  class Client
    module Launchpads
      def launchpads
        get("launchpads")
      end

      def get_launchpad(id)
        get("launchpads/#{id}")
      end

      def query_launchpads(body = nil)
        post("launchpads/query", body)
      end
    end
  end
end
