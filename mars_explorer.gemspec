# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mars_explorer/version'

Gem::Specification.new do |spec|
  spec.name          = "mars_explorer"
  spec.version       = MarsExplorer::VERSION
  spec.authors       = ["Fotos Georgiadis"]
  spec.email         = ["gfotos@gmail.com"]

  spec.summary       = 'Mars rover exploration'
  spec.description   = 'Simple gem for demonstrating rovers'
  spec.homepage      = 'https://github.com/fotos/mars_explorer'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
