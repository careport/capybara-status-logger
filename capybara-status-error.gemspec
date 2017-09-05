# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "capybara/status/error/version"

Gem::Specification.new do |spec|
  spec.name          = "capybara-status-error"
  spec.version       = Capybara::Status::Error::VERSION
  spec.authors       = ["Saad Rhoulam"]
  spec.email         = ["saad.rhoulam@careporthealth.com"]

  spec.summary       = %q{Print meaningful error messages to console when the visited page is served with a non-successful HTTP status code.}
  spec.description   = %q{A mixin for Capybara page objects that overrides `#visit` with a method that tests for successful HTTP status codes and throws a meaningful error message otherwise..}
  spec.homepage      = "https://github.com/careport/capybara-status-error"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.3'

  spec.add_runtime_dependency "capybara", "~> 2.13"
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
