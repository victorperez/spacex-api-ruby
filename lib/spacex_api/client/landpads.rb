# frozen_string_literal: true

module SpacexApi
  class Client
    module Landpads
      def landpads
        get("landpads")
      end

      def get_landpad(id)
        get("landpads/#{id}")
      end

      def query_landpads(body = nil)
        post("landpads/query", body)
      end
    end
  end
end
