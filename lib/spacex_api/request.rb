module SpacexApi
  class Request
    class << self
      def call(method, path)
        case method
        when :get
          connection.get(path).body
        when :post
          connection.post(path).body
        end
      end

      private

      def connection
        Faraday.new(
          url: "#{SpacexApi::BASE_URI}/#{SpacexApi.configuration.version}"
        ) do |connection|
          connection.adapter Faraday.default_adapter

          connection.response :logger
          connection.response :json, :content_type => /\bjson$/

          connection.use Faraday::Response::RaiseError
        end
      end
    end
  end
end
