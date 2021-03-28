module SpacexApi
  class Client
    module Dragons
      def dragons
        get("dragons")
      end

      def get_dragon(id)
        get("dragons/#{id}")
      end
    end
  end
end
