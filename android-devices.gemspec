Gem::Specification.new do |spec|
  spec.name		= 'android-devices'
  spec.version		= '2.0.1'
  spec.authors		= ['Jon Wilson']
  spec.email		= ['jon.wilson01@bbc.co.uk']
  spec.summary		= %q{Human readable Android device names}
  spec.license		= 'MIT'
  spec.homepage 	= 'https://github.com/bbc/android-devices'

  spec.files 		= `git ls-files -z`.split("\x0")
  spec.require_paths	= ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
end
