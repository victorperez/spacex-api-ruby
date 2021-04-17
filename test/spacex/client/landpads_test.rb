# frozen_string_literal: true

require "test_helper"

class LandpadsTest < Minitest::Test
  LANDPAD_SCHEMA = %i[name full_name status type locality region latitude
                      longitude landing_attempts landing_successes wikipedia
                      details launches].freeze

  def test_landpads
    VCR.use_cassette("landpads") do
      response = SpacexApi.client.landpads

      assert_instance_of Array, response
      assert_equal "5e9e3032383ecb267a34e7c7", response.first[:id]
      LANDPAD_SCHEMA.each do |key|
        assert response.first.key?(key)
      end
    end
  end

  def test_get_landpad
    VCR.use_cassette("get_landpad") do
      response = SpacexApi.client.get_landpad("5e9e3032383ecb267a34e7c7")

      assert_instance_of Hash, response
      assert_equal "5e9e3032383ecb267a34e7c7", response[:id]
      LANDPAD_SCHEMA.each do |key|
        assert response.key?(key)
      end
    end
  end

  def test_query_landpads_with_empty_body
    VCR.use_cassette("query_landpads_with_empty_body") do
      response = SpacexApi.client.query_landpads({}.to_json)

      assert_instance_of Hash, response
      assert_equal "5e9e3032383ecb267a34e7c7", response[:docs].first[:id]
      LANDPAD_SCHEMA.each do |key|
        assert response[:docs].first.key?(key)
      end
    end
  end

  def test_query_landpads_with_dates_that_does_not_return_results
    VCR.use_cassette("query_landpads_with_dates_that_does_not_return_results") do
      query = {
        query: {
          date_utc: {
            "$gte": "2010-06-22T00:00:00.000Z",
            "$lte": "2010-06-25T00:00:00.000Z"
          }
        }
      }

      response = SpacexApi.client.query_landpads({ query: query, options: {} }.to_json)

      assert_instance_of Hash, response
      assert_empty response[:docs]
    end
  end
end
