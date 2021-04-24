# frozen_string_literal: true

require "test_helper"

class DragonsTest < Minitest::Test
  DRAGON_SCHEMA = %i[name type active crew_capacity sidewall_angle_deg orbit_duration_yr
                     dry_mass_kg dry_mass_lb first_flight heat_shield thrusters
                     launch_payload_mass launch_payload_vol return_payload_mass
                     return_payload_vol pressurized_capsule trunk height_w_trunk
                     diameter flickr_images wikipedia description].freeze

  def test_dragons
    VCR.use_cassette("dragons") do
      response = SpacexApi.client.dragons

      assert_instance_of Array, response
      assert_equal "5e9d058759b1ff74a7ad5f8f", response.first.id
      DRAGON_SCHEMA.each do |key|
        assert response.first.to_h.key?(key)
      end
    end
  end

  def test_get_dragon
    VCR.use_cassette("get_dragon") do
      response = SpacexApi.client.get_dragon("5e9d058759b1ff74a7ad5f8f")

      assert_instance_of OpenStruct, response
      assert_equal "5e9d058759b1ff74a7ad5f8f", response.id
      DRAGON_SCHEMA.each do |key|
        assert response.to_h.key?(key)
      end
    end
  end

  def test_query_dragons_with_empty_body
    VCR.use_cassette("query_dragons_with_empty_body") do
      response = SpacexApi.client.query_dragons({}.to_json)

      assert_instance_of OpenStruct, response
      assert_equal "5e9d058759b1ff74a7ad5f8f", response.docs.first.id
      DRAGON_SCHEMA.each do |key|
        assert response.docs.first.to_h.key?(key)
      end
    end
  end

  def test_query_dragons_with_dates_that_does_not_return_results
    VCR.use_cassette("query_dragons_with_dates_that_does_not_return_results") do
      query = {
        query: {
          date_utc: {
            "$gte": "2010-06-22T00:00:00.000Z",
            "$lte": "2010-06-25T00:00:00.000Z"
          }
        }
      }

      response = SpacexApi.client.query_dragons({ query: query, options: {} }.to_json)

      assert_instance_of OpenStruct, response
      assert_empty response.docs
    end
  end
end
