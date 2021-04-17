# frozen_string_literal: true

require "test_helper"

class LaunchesTest < Minitest::Test
  LAUNCH_SCHEMA = %i[flight_number name date_utc date_unix date_local
                     date_precision static_fire_date_utc static_fire_date_unix
                     tbd net window rocket success failures upcoming details
                     fairings crew ships capsules payloads launchpad cores links
                     auto_update].freeze

  def test_past_launches
    VCR.use_cassette("past_launches") do
      response = SpacexApi.client.past_launches

      assert_instance_of Array, response
      LAUNCH_SCHEMA.each do |key|
        assert response.first.key?(key)
      end
    end
  end

  def test_upcoming_launches
    VCR.use_cassette("upcoming_launches") do
      response = SpacexApi.client.upcoming_launches

      assert_instance_of Array, response
      LAUNCH_SCHEMA.each do |key|
        assert response.first.key?(key)
      end
    end
  end

  def test_latest_launch
    VCR.use_cassette("latest_launch") do
      response = SpacexApi.client.latest_launch

      assert_instance_of Hash, response
      LAUNCH_SCHEMA.each do |key|
        assert response.key?(key)
      end
    end
  end

  def test_next_launch
    VCR.use_cassette("next_launch") do
      response = SpacexApi.client.next_launch

      assert_instance_of Hash, response
      LAUNCH_SCHEMA.each do |key|
        assert response.key?(key)
      end
    end
  end

  def test_launches
    VCR.use_cassette("launches") do
      response = SpacexApi.client.launches

      assert_instance_of Array, response
      assert_equal "5eb87cd9ffd86e000604b32a", response.first[:id]
      LAUNCH_SCHEMA.each do |key|
        assert response.first.key?(key)
      end
    end
  end

  def test_get_launch
    VCR.use_cassette("get_launch") do
      response = SpacexApi.client.get_launch("5eb87cd9ffd86e000604b32a")

      assert_instance_of Hash, response
      assert_equal "5eb87cd9ffd86e000604b32a", response[:id]
      LAUNCH_SCHEMA.each do |key|
        assert response.key?(key)
      end
    end
  end

  def test_query_launches_with_empty_body
    VCR.use_cassette("query_launches_with_empty_body") do
      response = SpacexApi.client.query_launches({}.to_json)

      assert_instance_of Hash, response
      assert_equal "5eb87cd9ffd86e000604b32a", response[:docs].first[:id]
      LAUNCH_SCHEMA.each do |key|
        assert response[:docs].first.key?(key)
      end
    end
  end

  def test_query_launches_with_dates_that_does_not_return_results
    VCR.use_cassette("query_launches_with_dates_that_does_not_return_results") do
      query = {
        query: {
          date_utc: {
            "$gte": "2010-06-22T00:00:00.000Z",
            "$lte": "2010-06-25T00:00:00.000Z"
          }
        }
      }

      response = SpacexApi.client.query_launches({ query: query, options: {} }.to_json)

      assert_instance_of Hash, response
      assert_empty response[:docs]
    end
  end
end
