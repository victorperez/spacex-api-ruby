module SpacexApi
  class Client
    module Ships
      def ships
        get("ships")
      end

      def get_ship(id)
        get("ships/#{id}")
      end
    end
  end
end
