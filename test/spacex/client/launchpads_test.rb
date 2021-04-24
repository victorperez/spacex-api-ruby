# frozen_string_literal: true

require "test_helper"

class LaunchpadsTest < Minitest::Test
  LAUNCHPAD_SCHEMA = %i[name full_name status locality region timezone latitude
                        longitude launch_attempts launch_successes rockets launches].freeze

  def test_launchpads
    VCR.use_cassette("launchpads") do
      response = SpacexApi.client.launchpads

      assert_instance_of Array, response
      assert_equal "5e9e4501f5090910d4566f83", response.first.id
      LAUNCHPAD_SCHEMA.each do |key|
        assert response.first.to_h.key?(key)
      end
    end
  end

  def test_get_launchpad
    VCR.use_cassette("get_launchpad") do
      response = SpacexApi.client.get_launchpad("5e9e4501f5090910d4566f83")

      assert_instance_of OpenStruct, response
      assert_equal "5e9e4501f5090910d4566f83", response.id
      LAUNCHPAD_SCHEMA.each do |key|
        assert response.to_h.key?(key)
      end
    end
  end

  def test_query_launchpads_with_empty_body
    VCR.use_cassette("query_launchpads_with_empty_body") do
      response = SpacexApi.client.query_launchpads({}.to_json)

      assert_instance_of OpenStruct, response
      assert_equal "5e9e4501f5090910d4566f83", response.docs.first.id
      LAUNCHPAD_SCHEMA.each do |key|
        assert response.docs.first.to_h.key?(key)
      end
    end
  end

  def test_query_launchpads_with_dates_that_does_not_return_results
    VCR.use_cassette("query_launchpads_with_dates_that_does_not_return_results") do
      query = {
        query: {
          date_utc: {
            "$gte": "2010-06-22T00:00:00.000Z",
            "$lte": "2010-06-25T00:00:00.000Z"
          }
        }
      }

      response = SpacexApi.client.query_launchpads({ query: query, options: {} }.to_json)

      assert_instance_of OpenStruct, response
      assert_empty response.docs
    end
  end
end
