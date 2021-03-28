module SpacexApi
  class Client
    module Capsules
      def capsules
        get("capsules")
      end

      def get_capsule(id)
        get("capsules/#{id}")
      end
    end
  end
end
