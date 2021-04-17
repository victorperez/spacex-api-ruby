# frozen_string_literal: true

require "test_helper"

class CompanyInfoTest < Minitest::Test
  COMPANY_SCHEMA = %i[headquarters links name founder founded employees vehicles
                      launch_sites test_sites ceo cto coo cto_propulsion valuation
                      summary id].freeze

  def test_company_info
    VCR.use_cassette("company_info") do
      response = SpacexApi.client.company_info

      assert_instance_of Hash, response
      COMPANY_SCHEMA.each do |key|
        assert response.key?(key)
      end
    end
  end
end
