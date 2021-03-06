# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cards_systems/version'

Gem::Specification.new do |spec|
  spec.name          = 'cards_systems'
  spec.version       = CardsSystems::VERSION
  spec.authors       = ['Alan Rafael R. Batista']
  spec.email         = ['alan@campuscode.com.br']

  spec.summary       = ' A simple app example for a gentle Ruby introduction '
  spec.description   = ' One of firsts ruby exercise of "Imersão Campus Code" '
  spec.homepage      = 'https://git.campuscode.com.br/alanrrb/cards_systems'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables << 'cards'
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'simplecov', '~> 0.12'
  spec.add_development_dependency 'pry-byebug', '~> 3.4'
  spec.add_development_dependency 'rubocop', '~> 0.49.0'
end
