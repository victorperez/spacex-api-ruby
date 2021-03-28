module SpacexApi
  class Client
    module Launchpads
      def launchpads
        get("launchpads")
      end

      def get_launchpad(id)
        get("launchpads/#{id}")
      end
    end
  end
end
