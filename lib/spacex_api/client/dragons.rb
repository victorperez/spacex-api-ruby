# frozen_string_literal: true

module SpacexApi
  class Client
    module Dragons
      def dragons
        get("dragons")
      end

      def get_dragon(id)
        get("dragons/#{id}")
      end

      def query_dragons(body = nil)
        post("dragons/query", body)
      end
    end
  end
end
