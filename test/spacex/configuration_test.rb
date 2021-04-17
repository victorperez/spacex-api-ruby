# frozen_string_literal: true

require "test_helper"

class ConfigurationTest < Minitest::Test
  def test_that_it_has_a_logger_default_value
    assert_equal false, SpacexApi.configuration.logger
  end

  def test_that_it_has_a_version_default_value
    assert_equal "v4", SpacexApi.configuration.version
  end
end
