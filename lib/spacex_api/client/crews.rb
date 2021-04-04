module SpacexApi
  class Client
    module Crews
      def crews
        get("crew")
      end

      def get_crew(id)
        get("crew/#{id}")
      end

      def query_crews(body = nil)
        post("crew/query", body)
      end
    end
  end
end
