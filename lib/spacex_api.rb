require "faraday"
require "faraday_middleware"

require "spacex_api/base_uri"
require "spacex_api/client"
require "spacex_api/configuration"
require "spacex_api/request"
require "spacex_api/version"

module SpacexApi
  def self.client
    SpacexApi::Client.new
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end