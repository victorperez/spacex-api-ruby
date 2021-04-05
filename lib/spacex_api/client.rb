# frozen_string_literal: true

require "spacex_api/client/capsules"
require "spacex_api/client/company_info"
require "spacex_api/client/cores"
require "spacex_api/client/crews"
require "spacex_api/client/dragons"
require "spacex_api/client/history"
require "spacex_api/client/landpads"
require "spacex_api/client/launches"
require "spacex_api/client/launchpads"
require "spacex_api/client/payloads"
require "spacex_api/client/roadster_info"
require "spacex_api/client/rockets"
require "spacex_api/client/ships"
require "spacex_api/client/starlink"

module SpacexApi
  class Client
    include SpacexApi::Client::Capsules
    include SpacexApi::Client::CompanyInfo
    include SpacexApi::Client::Cores
    include SpacexApi::Client::Crews
    include SpacexApi::Client::Dragons
    include SpacexApi::Client::History
    include SpacexApi::Client::Landpads
    include SpacexApi::Client::Launches
    include SpacexApi::Client::Launchpads
    include SpacexApi::Client::Payloads
    include SpacexApi::Client::RoadsterInfo
    include SpacexApi::Client::Rockets
    include SpacexApi::Client::Ships
    include SpacexApi::Client::Starlink

    def get(path)
      request(:get, path)
    end

    def post(path, body = nil)
      request(:post, path, body)
    end

    private

    def request(method, path, body = nil)
      Request.call(method, path, body)
    end
  end
end
