lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'android/devices'

Gem::Specification.new do |spec|
  spec.name		= 'android-devices'
  spec.version		= Android::Devices::VERSION
  spec.authors		= ['Jon Wilson']
  spec.email		= ['jon.wilson01@bbc.co.uk']
  spec.summary		= %q{Human readable Android device names}

  spec.files 		= `git ls-files -z`.split("\x0")
  spec.require_paths	= ['lib']
  
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
end
