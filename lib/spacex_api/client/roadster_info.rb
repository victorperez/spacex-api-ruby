module SpacexApi
  class Client
    module RoadsterInfo
      def roadster
        get("roadster")
      end
    end
  end
end
