# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kenma/version'

Gem::Specification.new do |spec|
  spec.name          = 'kenma'
  spec.version       = Kenma::VERSION
  spec.authors       = ['tbpgr']
  spec.email         = ['tbpgr@tbpgr.jp']
  spec.summary       = 'Kenma is pluggable Question-Answer tool.'
  spec.description   = 'Kenma is pluggable Question-Answer tool.'
  spec.homepage      = 'https://github.com/tbpgr/kenma'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'thor'
  spec.add_runtime_dependency 'enel'
  spec.add_runtime_dependency 'bundler'
  spec.add_runtime_dependency 'activesupport'
  spec.add_runtime_dependency 'rb-readline'

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
