# frozen_string_literal: true

require "test_helper"

class ShipsTest < Minitest::Test
  SHIP_SCHEMA = %i[name legacy_id model type roles active imo mmsi abs class
                   mass_kg mass_lbs year_built home_port status speed_kn course_deg
                   latitude longitude last_ais_update link image launches].freeze

  def test_ships
    VCR.use_cassette("ships") do
      response = SpacexApi.client.ships

      assert_instance_of Array, response
      assert_equal "5ea6ed2d080df4000697c901", response.first.id
      SHIP_SCHEMA.each do |key|
        assert response.first.to_h.key?(key)
      end
    end
  end

  def test_get_ship
    VCR.use_cassette("get_ship") do
      response = SpacexApi.client.get_ship("5ea6ed2d080df4000697c901")

      assert_instance_of OpenStruct, response
      assert_equal "5ea6ed2d080df4000697c901", response.id
      SHIP_SCHEMA.each do |key|
        assert response.to_h.key?(key)
      end
    end
  end

  def test_query_ships_with_empty_body
    VCR.use_cassette("query_ships_with_empty_body") do
      response = SpacexApi.client.query_ships({}.to_json)

      assert_instance_of OpenStruct, response
      assert_equal "5ea6ed2d080df4000697c901", response.docs.first.id
      SHIP_SCHEMA.each do |key|
        assert response.docs.first.to_h.key?(key)
      end
    end
  end

  def test_query_ships_with_dates_that_does_not_return_results
    VCR.use_cassette("query_ships_with_dates_that_does_not_return_results") do
      query = {
        query: {
          date_utc: {
            "$gte": "2010-06-22T00:00:00.000Z",
            "$lte": "2010-06-25T00:00:00.000Z"
          }
        }
      }

      response = SpacexApi.client.query_ships({ query: query, options: {} }.to_json)

      assert_instance_of OpenStruct, response
      assert_empty response.docs
    end
  end
end
