lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'android/devices'

Gem::Specification.new do |spec|
  spec.name		= 'android-devices'
  spec.version		= Android::Devices::VERSION
  spec.authors		= ['Jon Wilson']
  spec.email		= ['jon.wilson01@bbc.co.uk']
end
