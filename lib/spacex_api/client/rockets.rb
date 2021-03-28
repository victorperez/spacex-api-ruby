module SpacexApi
  class Client
    module Rockets
      def rockets
        get("rockets")
      end

      def get_rocket(id)
        get("rockets/#{id}")
      end
    end
  end
end
