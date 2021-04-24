# frozen_string_literal: true

require "test_helper"

class RoadsterInfoTest < Minitest::Test
  ROADSTER_SCHEMA = %i[name launch_date_utc launch_date_unix launch_mass_kg
                       launch_mass_lbs norad_id epoch_jd orbit_type apoapsis_au
                       periapsis_au semi_major_axis_au eccentricity inclination
                       longitude periapsis_arg period_days speed_kph speed_mph
                       earth_distance_km earth_distance_mi mars_distance_km
                       mars_distance_mi flickr_images wikipedia video details].freeze

  def test_roadster
    VCR.use_cassette("roadster") do
      response = SpacexApi.client.roadster

      assert_instance_of OpenStruct, response
      ROADSTER_SCHEMA.each do |key|
        assert response.to_h.key?(key)
      end
    end
  end

  def test_query_roadster_with_empty_body
    VCR.use_cassette("query_roadster_with_empty_body") do
      response = SpacexApi.client.query_roadster({}.to_json)

      assert_instance_of OpenStruct, response
      ROADSTER_SCHEMA.each do |key|
        assert response.to_h.key?(key)
      end
    end
  end

  def test_query_roadster_with_dates_that_does_not_return_results
    VCR.use_cassette("query_roadster_with_dates_that_does_not_return_results") do
      query = {
        query: {
          date_utc: {
            "$gte": "2010-06-22T00:00:00.000Z",
            "$lte": "2010-06-25T00:00:00.000Z"
          }
        }
      }

      response = SpacexApi.client.query_roadster({ query: query, options: {} }.to_json)

      assert_empty response
    end
  end
end
