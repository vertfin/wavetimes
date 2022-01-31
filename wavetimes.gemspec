# frozen_string_literal: true

require_relative "lib/wavetimes/version"

Gem::Specification.new do |spec|
  spec.name = "wavetimes"
  spec.version = Wavetimes::VERSION
  spec.authors = ["jms"]
  spec.email = ["jon@jms-audioware.com"]

  spec.summary = "Generate pretty time sheets from a group of .wav files."
  spec.homepage = "http://github.com/vertfin/wavetimes"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://github.com/vertfin/wavetimes"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  #spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "optparse"
  spec.add_dependency "wavefile"
  # spec.add_dependency "open-uri"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
