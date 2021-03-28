module SpacexApi
  class Client
    module Crews
      def crews
        get("crew")
      end

      def get_crew(id)
        get("crew/#{id}")
      end
    end
  end
end
