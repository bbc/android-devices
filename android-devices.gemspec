# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'android-devices'
  spec.version = '3.0.6'
  spec.authors = ['Jon Wilson']
  spec.email = ['jon.wilson01@bbc.co.uk']
  spec.summary = 'Human readable Android device names'
  spec.license = 'MIT'
  spec.homepage = 'https://github.com/bbc/android-devices'

  spec.files = `git ls-files -z`.split("\x0")
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.5.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
