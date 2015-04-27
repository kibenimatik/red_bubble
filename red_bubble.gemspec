# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'red_bubble/version'

Gem::Specification.new do |spec|
  spec.name          = "red_bubble"
  spec.version       = RedBubble::VERSION
  spec.authors       = ["Timur Valeev"]
  spec.email         = ["kibenimatik@yandex.ru"]

  spec.summary       = "HTML Gallery generator"
  spec.homepage      = "http://github.com/kibenimatik/red_bubble"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ['red_bubble']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency('rdoc')
  spec.add_development_dependency('aruba')
  spec.add_development_dependency('rake')
  spec.add_dependency('methadone', '~> 1.9.0')
  spec.add_dependency('nokogiri', '~> 1.6.6.2')
  spec.add_dependency('liquid', '~> 3.0.1')
  spec.add_dependency('supermodel', '~> 0.1.6')
  spec.add_development_dependency('rspec', '~> 2.99')
  spec.add_development_dependency('pry')
end
