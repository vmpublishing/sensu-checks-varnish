# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)


if RUBY_VERSION < '2.0.0'
  require 'sensu-checks-varnish'
else
  require_relative 'lib/sensu-checks-varnish'
end


Gem::Specification.new do |spec|
  spec.name          = "sensu-checks-varnish"
  spec.version       = SensuChecksVarnish::Version::VER_STRING
  spec.authors       = ["vmpublishing development"]
  spec.email         = ["dev@vmpublishing.com"]

  spec.summary       = 'sensu gem to get varnish metrics.'
  spec.description   = 'sensu gem to get varnish metrics. Uses plain data out of varnish. Supports sudo. Supports more than one varnish instance per host.'
  spec.homepage      = "https://github.com/vmpublishing/sensu-checks-varnish"
  spec.license       = 'Nonstandard'


  spec.files         = Dir.glob('{bin,lib}/**/*') + %w(LICENSE README.md)
  spec.executables   = Dir.glob('bin/**/*.rb').map { |file| File.basename(file) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'sensu-plugin', '~> 1.2'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end

