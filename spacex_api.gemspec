# frozen_string_literal: true

require_relative "lib/spacex_api/version"

Gem::Specification.new do |spec|
  spec.name          = "spacex_api"
  spec.version       = SpacexApi::VERSION
  spec.authors       = ["Victor Perez Rodriguez"]
  spec.email         = ["victor.mx14@gmail.com"]

  spec.summary       = "Spacex API Ruby wrapper"
  spec.description   = "Ruby API wrapper to consume the SpaceX API"
  spec.homepage      = "https://github.com/victorperez/spacex-api-ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 1.0"
  spec.add_dependency "faraday_middleware", "~> 1.0"

  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "rubocop", "1.12"
  spec.add_development_dependency "vcr", "~> 6.0"
  spec.add_development_dependency "webmock", "~> 3.12"
end
