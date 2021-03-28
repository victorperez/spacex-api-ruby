module SpacexApi
  class Client
    module Landpads
      def landpads
        get("landpads")
      end

      def get_landpad(id)
        get("landpads/#{id}")
      end
    end
  end
end
