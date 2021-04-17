# frozen_string_literal: true

require "test_helper"

class RocketsTest < Minitest::Test
  ROCKET_SCHEMA = %i[name type active stages boosters cost_per_launch success_rate_pct
                     first_flight country company height diameter mass payload_weights
                     first_stage second_stage engines landing_legs flickr_images
                     wikipedia description].freeze

  def test_rockets
    VCR.use_cassette("rockets") do
      response = SpacexApi.client.rockets

      assert_instance_of Array, response
      assert_equal "5e9d0d95eda69955f709d1eb", response.first[:id]
      ROCKET_SCHEMA.each do |key|
        assert response.first.key?(key)
      end
    end
  end

  def test_get_rocket
    VCR.use_cassette("get_rocket") do
      response = SpacexApi.client.get_rocket("5e9d0d95eda69955f709d1eb")

      assert_instance_of Hash, response
      assert_equal "5e9d0d95eda69955f709d1eb", response[:id]
      ROCKET_SCHEMA.each do |key|
        assert response.key?(key)
      end
    end
  end

  def test_query_rockets_with_empty_body
    VCR.use_cassette("query_rockets_with_empty_body") do
      response = SpacexApi.client.query_rockets({}.to_json)

      assert_instance_of Hash, response
      assert_equal "5e9d0d95eda69955f709d1eb", response[:docs].first[:id]
      ROCKET_SCHEMA.each do |key|
        assert response[:docs].first.key?(key)
      end
    end
  end

  def test_query_rockets_with_dates_that_does_not_return_results
    VCR.use_cassette("query_rockets_with_dates_that_does_not_return_results") do
      query = {
        query: {
          date_utc: {
            "$gte": "2010-06-22T00:00:00.000Z",
            "$lte": "2010-06-25T00:00:00.000Z"
          }
        }
      }

      response = SpacexApi.client.query_rockets({ query: query, options: {} }.to_json)

      assert_instance_of Hash, response
      assert_empty response[:docs]
    end
  end
end
