# frozen_string_literal: true

require "test_helper"

class PayloadsTest < Minitest::Test
  PAYLOAD_SCHEMA = %i[name type reused launch customers norad_ids nationalities
                      manufacturers mass_kg mass_lbs orbit reference_system regime
                      longitude semi_major_axis_km eccentricity periapsis_km
                      apoapsis_km inclination_deg period_min lifespan_years epoch
                      mean_motion raan arg_of_pericenter mean_anomaly dragon].freeze

  def test_payloads
    VCR.use_cassette("payloads") do
      response = SpacexApi.client.payloads

      assert_instance_of Array, response
      assert_equal "5eb0e4b5b6c3bb0006eeb1e1", response.first.id
      PAYLOAD_SCHEMA.each do |key|
        assert response.first.to_h.key?(key)
      end
    end
  end

  def test_get_payload
    VCR.use_cassette("get_payload") do
      response = SpacexApi.client.get_payload("5eb0e4b5b6c3bb0006eeb1e1")

      assert_instance_of OpenStruct, response
      assert_equal "5eb0e4b5b6c3bb0006eeb1e1", response.id
      PAYLOAD_SCHEMA.each do |key|
        assert response.to_h.key?(key)
      end
    end
  end

  def test_query_payloads_with_empty_body
    VCR.use_cassette("query_payloads_with_empty_body") do
      response = SpacexApi.client.query_payloads({}.to_json)

      assert_instance_of OpenStruct, response
      assert_equal "5eb0e4b5b6c3bb0006eeb1e1", response.docs.first.id
      PAYLOAD_SCHEMA.each do |key|
        assert response.docs.first.to_h.key?(key)
      end
    end
  end

  def test_query_payloads_with_dates_that_does_not_return_results
    VCR.use_cassette("query_payloads_with_dates_that_does_not_return_results") do
      query = {
        query: {
          date_utc: {
            "$gte": "2010-06-22T00:00:00.000Z",
            "$lte": "2010-06-25T00:00:00.000Z"
          }
        }
      }

      response = SpacexApi.client.query_payloads({ query: query, options: {} }.to_json)

      assert_instance_of OpenStruct, response
      assert_empty response.docs
    end
  end
end
