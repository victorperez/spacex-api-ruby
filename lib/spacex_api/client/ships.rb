module SpacexApi
  class Client
    module Ships
      def ships
        get("ships")
      end

      def get_ship(id)
        get("ships/#{id}")
      end

      def query_ships(body = nil)
        post("ships/query", body)
      end
    end
  end
end
