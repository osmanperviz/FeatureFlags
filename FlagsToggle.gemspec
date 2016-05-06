# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'FlagsToggle/version'

Gem::Specification.new do |spec|
  spec.name          = "flagsToggle"
  spec.version       = FlagsToggle::VERSION
  spec.authors       = ["Osman Perviz"]
  spec.email         = ["osmanperviz@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  end

  spec.summary       = %q{A flagsToggle is a branching point that your code can utilize to determine whether or not a feature should be made available to one or more customers.}
  spec.description   = %q{flagsToggle provides a declarative, layered way of enabling and disabling application functionality at run-time}
  spec.homepage      = "https://github.com/osmanperviz/FeatureFlags"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'pry'
end
