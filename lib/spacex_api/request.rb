# frozen_string_literal: true

require "ostruct"

module SpacexApi
  class Request
    class << self
      def call(method, path, body = nil)
        case method
        when :get
          connection.get(path).body
        when :post
          connection.post do |request|
            request.path = path
            request.body = body if body
          end.body
        end
      end

      private

      def connection
        Faraday.new(
          url: "#{SpacexApi::BASE_URI}/#{SpacexApi.configuration.version}",
          headers: { "Content-Type" => "application/json" }
        ) do |connection|
          connection.adapter Faraday.default_adapter

          connection.response :logger if SpacexApi.configuration.logger
          connection.response :json, content_type: /\bjson$/, parser_options: { object_class: OpenStruct }

          connection.use Faraday::Response::RaiseError
        end
      end
    end
  end
end
