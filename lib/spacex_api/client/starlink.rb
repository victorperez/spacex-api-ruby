# frozen_string_literal: true

module SpacexApi
  class Client
    module Starlink
      def starlinks
        get("starlink")
      end

      def get_starlink(id)
        get("starlink/#{id}")
      end

      def query_starlinks(body = nil)
        post("starlink/query", body)
      end
    end
  end
end
