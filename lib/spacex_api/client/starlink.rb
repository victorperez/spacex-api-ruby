module SpacexApi
  class Client
    module Starlink
      def starlinks
        get("starlink")
      end

      def get_starlink(id)
        get("starlink/#{id}")
      end
    end
  end
end
