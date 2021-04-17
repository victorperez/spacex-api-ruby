# frozen_string_literal: true

require "test_helper"

class SpacexApiTest < Minitest::Test
  def test_configure
    SpacexApi.configure do |config|
      config.logger = true
    end

    assert SpacexApi.configuration.logger

    SpacexApi.configure do |config|
      config.logger = false
    end

    assert_equal false, SpacexApi.configuration.logger
  end
end
