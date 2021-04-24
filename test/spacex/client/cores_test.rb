# frozen_string_literal: true

require "test_helper"

class CoresTest < Minitest::Test
  CORE_SCHEMA = %i[serial block status reuse_count rtls_attempts rtls_landings
                   asds_attempts asds_landings last_update launches].freeze

  def test_cores
    VCR.use_cassette("cores") do
      response = SpacexApi.client.cores

      assert_instance_of Array, response
      assert_equal "5e9e289df35918033d3b2623", response.first.id
      CORE_SCHEMA.each do |key|
        assert response.first.to_h.key?(key)
      end
    end
  end

  def test_get_core
    VCR.use_cassette("get_core") do
      response = SpacexApi.client.get_core("5e9e289df35918033d3b2623")

      assert_instance_of OpenStruct, response
      assert_equal "5e9e289df35918033d3b2623", response.id
      CORE_SCHEMA.each do |key|
        assert response.to_h.key?(key)
      end
    end
  end

  def test_query_cores_with_empty_body
    VCR.use_cassette("query_cores_with_empty_body") do
      response = SpacexApi.client.query_cores({}.to_json)

      assert_instance_of OpenStruct, response
      assert_equal "5e9e289df35918033d3b2623", response.docs.first.id
      CORE_SCHEMA.each do |key|
        assert response.docs.first.to_h.key?(key)
      end
    end
  end

  def test_query_cores_with_dates_that_does_not_return_results
    VCR.use_cassette("query_cores_with_dates_that_does_not_return_results") do
      query = {
        query: {
          date_utc: {
            "$gte": "2010-06-22T00:00:00.000Z",
            "$lte": "2010-06-25T00:00:00.000Z"
          }
        }
      }

      response = SpacexApi.client.query_cores({ query: query, options: {} }.to_json)

      assert_instance_of OpenStruct, response
      assert_empty response.docs
    end
  end
end
