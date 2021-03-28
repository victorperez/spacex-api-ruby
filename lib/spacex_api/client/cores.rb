module SpacexApi
  class Client
    module Cores
      def cores
        get("cores")
      end

      def get_core(id)
        get("cores/#{id}")
      end
    end
  end
end
