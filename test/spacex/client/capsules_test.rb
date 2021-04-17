# frozen_string_literal: true

require "test_helper"

class CapsulesTest < Minitest::Test
  CAPSULE_SCHEMA = %i[reuse_count water_landings land_landings last_update
                      launches serial status type].freeze

  def test_capsules
    VCR.use_cassette("capsules") do
      response = SpacexApi.client.capsules

      assert_instance_of Array, response
      assert_equal "5e9e2c5bf35918ed873b2664", response.first[:id]
      CAPSULE_SCHEMA.each do |key|
        assert response.first.key?(key)
      end
    end
  end

  def test_get_capsule
    VCR.use_cassette("get_capsule") do
      response = SpacexApi.client.get_capsule("5e9e2c5bf35918ed873b2664")

      assert_instance_of Hash, response
      assert_equal "5e9e2c5bf35918ed873b2664", response[:id]
      CAPSULE_SCHEMA.each do |key|
        assert response.key?(key)
      end
    end
  end

  def test_query_capsules_with_empty_body
    VCR.use_cassette("query_capsules_with_empty_body") do
      response = SpacexApi.client.query_capsules({}.to_json)

      assert_instance_of Hash, response
      assert_equal "5e9e2c5bf35918ed873b2664", response[:docs].first[:id]
      CAPSULE_SCHEMA.each do |key|
        assert response[:docs].first.key?(key)
      end
    end
  end

  def test_query_capsules_with_dates_that_does_not_return_results
    VCR.use_cassette("query_capsules_with_dates_that_does_not_return_results") do
      query = {
        query: {
          date_utc: {
            "$gte": "2010-06-22T00:00:00.000Z",
            "$lte": "2010-06-25T00:00:00.000Z"
          }
        }
      }

      response = SpacexApi.client.query_capsules({ query: query, options: {} }.to_json)

      assert_instance_of Hash, response
      assert_empty response[:docs]
    end
  end
end
