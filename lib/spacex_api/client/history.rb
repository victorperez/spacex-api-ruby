# frozen_string_literal: true

module SpacexApi
  class Client
    module History
      def historical_events
        get("history")
      end

      def get_historical_event(id)
        get("history/#{id}")
      end

      def query_historical_events(body = nil)
        post("history/query", body)
      end
    end
  end
end
