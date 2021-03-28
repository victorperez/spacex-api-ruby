module SpacexApi
  class Client
    module History
      def historical_events
        get("history")
      end

      def get_historical_event(id)
        get("history/#{id}")
      end
    end
  end
end
