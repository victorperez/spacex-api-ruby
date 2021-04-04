module SpacexApi
  class Client
    module RoadsterInfo
      def roadster
        get("roadster")
      end

      def query_roadster(body = nil)
        post("roadster/query", body)
      end
    end
  end
end
