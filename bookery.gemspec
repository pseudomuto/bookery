# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bookery/version'

Gem::Specification.new do |spec|
  spec.name          = "bookery"
  spec.version       = Bookery::VERSION
  spec.authors       = ["David Muto"]
  spec.email         = ["david.muto@gmail.com"]
  spec.description   = %q{
    A gem that gives you the tools you need to write your own book
  }
  spec.summary       = %q{A simple way to author your book}
  spec.homepage      = 'https://github.com/pseudomuto/bookery'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.bindir        = 'libexec'
  spec.executables   = spec.files.grep(%r{^libexec/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('thor', '~> 0.18.1')
  spec.add_dependency('kramdown', '~> 1.3.0')
  spec.add_dependency('coderay', '~> 1.1.0')

  spec.add_development_dependency('bundler', '>= 1.3.5')
  spec.add_development_dependency('rake', '~> 10.1.1')
  spec.add_development_dependency('minitest', '~> 5.2.0')
  spec.add_development_dependency('mocha', '~> 0.14.0')
  spec.add_development_dependency('simplecov', '~> 0.8.2')
end
