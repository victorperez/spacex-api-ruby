module SpacexApi
  class Client
    module Capsules
      def capsules
        get("capsules")
      end

      def get_capsule(id)
        get("capsules/#{id}")
      end

      def query_capsules(body = nil)
        post("capsules/query", body)
      end
    end
  end
end
