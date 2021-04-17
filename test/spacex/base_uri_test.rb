# frozen_string_literal: true

require "test_helper"

class BaseUriTest < Minitest::Test
  def test_that_it_has_the_correct_base_uri
    assert_equal "https://api.spacexdata.com", SpacexApi::BASE_URI
  end
end
