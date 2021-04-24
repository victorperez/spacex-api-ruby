# frozen_string_literal: true

require "test_helper"

class StarlinkTest < Minitest::Test
  STARLINK_SCHEMA = %i[version launch longitude latitude height_km velocity_kms
                       spaceTrack].freeze

  def test_starlinks
    VCR.use_cassette("starlinks") do
      response = SpacexApi.client.starlinks

      assert_instance_of Array, response
      assert_equal "5eed770f096e59000698560d", response.first.id
      STARLINK_SCHEMA.each do |key|
        assert response.first.to_h.key?(key)
      end
    end
  end

  def test_get_starlink
    VCR.use_cassette("get_starlink") do
      response = SpacexApi.client.get_starlink("5eed770f096e59000698560d")

      assert_instance_of OpenStruct, response
      assert_equal "5eed770f096e59000698560d", response.id
      STARLINK_SCHEMA.each do |key|
        assert response.to_h.key?(key)
      end
    end
  end

  def test_query_starlinks_with_empty_body
    VCR.use_cassette("query_starlinks_with_empty_body") do
      response = SpacexApi.client.query_starlinks({}.to_json)

      assert_instance_of OpenStruct, response
      assert_equal "5eed770f096e59000698560d", response.docs.first.id
      STARLINK_SCHEMA.each do |key|
        assert response.docs.first.to_h.key?(key)
      end
    end
  end

  def test_query_starlinks_with_dates_that_does_not_return_results
    VCR.use_cassette("query_starlinks_with_dates_that_does_not_return_results") do
      query = {
        query: {
          date_utc: {
            "$gte": "2010-06-22T00:00:00.000Z",
            "$lte": "2010-06-25T00:00:00.000Z"
          }
        }
      }

      response = SpacexApi.client.query_starlinks({ query: query, options: {} }.to_json)

      assert_instance_of OpenStruct, response
      assert_empty response.docs
    end
  end
end
