module SpacexApi
  class Client
    module Launches
      def past_launches
        get("launches/past")
      end

      def upcoming_launches
        get("launches/upcoming")
      end

      def latest_launch
        get("launches/latest")
      end

      def next_launch
        get("launches/next")
      end

      def launches
        get("launches")
      end

      def get_launch(id)
        get("launches/#{id}")
      end

      def query_launches(body = nil)
        post("launches/query", body)
      end
    end
  end
end
