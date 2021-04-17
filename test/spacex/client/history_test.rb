# frozen_string_literal: true

require "test_helper"

class HistoryTest < Minitest::Test
  HISTORY_SCHEMA = %i[title event_date_utc event_date_unix details links].freeze

  def test_history
    VCR.use_cassette("history") do
      response = SpacexApi.client.historical_events

      assert_instance_of Array, response
      assert_equal "5f6fb2cfdcfdf403df37971e", response.first[:id]
      HISTORY_SCHEMA.each do |key|
        assert response.first.key?(key)
      end
    end
  end

  def test_get_history
    VCR.use_cassette("get_history") do
      response = SpacexApi.client.get_historical_event("5f6fb2cfdcfdf403df37971e")

      assert_instance_of Hash, response
      assert_equal "5f6fb2cfdcfdf403df37971e", response[:id]
      HISTORY_SCHEMA.each do |key|
        assert response.key?(key)
      end
    end
  end

  def test_query_history_with_empty_body
    VCR.use_cassette("query_history_with_empty_body") do
      response = SpacexApi.client.query_historical_events({}.to_json)

      assert_instance_of Hash, response
      assert_equal "5f6fb2cfdcfdf403df37971e", response[:docs].first[:id]
      HISTORY_SCHEMA.each do |key|
        assert response[:docs].first.key?(key)
      end
    end
  end

  def test_query_history_with_dates_that_does_not_return_results
    VCR.use_cassette("query_history_with_dates_that_does_not_return_results") do
      query = {
        query: {
          date_utc: {
            "$gte": "2010-06-22T00:00:00.000Z",
            "$lte": "2010-06-25T00:00:00.000Z"
          }
        }
      }

      response = SpacexApi.client.query_historical_events({ query: query, options: {} }.to_json)

      assert_instance_of Hash, response
      assert_empty response[:docs]
    end
  end
end
