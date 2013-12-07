# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bookery/version'

Gem::Specification.new do |spec|
  spec.name          = 'bookery'
  spec.version       = Bookery::VERSION
  spec.authors       = ['David Muto']
  spec.email         = ['david.muto@gmail.com']
  spec.description   = %q{A gem that gives you the tools you need to write your own book}
  spec.summary       = %q{A simple way to author your book}
  spec.homepage      = 'http://pseudomuto.com/'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'guard-minitest'
end
