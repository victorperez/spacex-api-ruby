# frozen_string_literal: true

require "test_helper"

class CrewsTest < Minitest::Test
  CORE_SCHEMA = %i[name status agency image wikipedia launches].freeze

  def test_crews
    VCR.use_cassette("crews") do
      response = SpacexApi.client.crews

      assert_instance_of Array, response
      assert_equal "5ebf1a6e23a9a60006e03a7a", response.first.id
      CORE_SCHEMA.each do |key|
        assert response.first.to_h.key?(key)
      end
    end
  end

  def test_get_crew
    VCR.use_cassette("get_crew") do
      response = SpacexApi.client.get_crew("5ebf1a6e23a9a60006e03a7a")

      assert_instance_of OpenStruct, response
      assert_equal "5ebf1a6e23a9a60006e03a7a", response.id
      CORE_SCHEMA.each do |key|
        assert response.to_h.key?(key)
      end
    end
  end

  def test_query_crews_with_empty_body
    VCR.use_cassette("query_crews_with_empty_body") do
      response = SpacexApi.client.query_crews({}.to_json)

      assert_instance_of OpenStruct, response
      assert_equal "5ebf1a6e23a9a60006e03a7a", response.docs.first.id
      CORE_SCHEMA.each do |key|
        assert response.docs.first.to_h.key?(key)
      end
    end
  end

  def test_query_crews_with_dates_that_does_not_return_results
    VCR.use_cassette("query_crews_with_dates_that_does_not_return_results") do
      query = {
        query: {
          date_utc: {
            "$gte": "2010-06-22T00:00:00.000Z",
            "$lte": "2010-06-25T00:00:00.000Z"
          }
        }
      }

      response = SpacexApi.client.query_crews({ query: query, options: {} }.to_json)

      assert_instance_of OpenStruct, response
      assert_empty response.docs
    end
  end
end
