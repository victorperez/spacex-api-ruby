# frozen_string_literal: true

module SpacexApi
  class Configuration
    attr_accessor :logger, :version

    def initialize
      @logger = false
      @version = "v4"
    end
  end
end
