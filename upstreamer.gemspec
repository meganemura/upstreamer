# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'upstreamer/version'

Gem::Specification.new do |spec|
  spec.name          = "upstreamer"
  spec.version       = Upstreamer::VERSION
  spec.authors       = ["meganemura"]
  spec.email         = ["mura2megane@gmail.com"]

  spec.summary       = "Add `upstream` remote-tracking branch to your forked repository by tracking GitHub."
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/meganemura/upstreamer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "octokit", "~> 3.4"
  spec.add_runtime_dependency "rugged", "~> 0.21"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
end
