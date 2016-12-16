# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'medium-editor-insert-plugin-rails/version'

Gem::Specification.new do |gem|
  gem.name          = 'medium-editor-insert-plugin-rails'
  gem.version       = MediumEditorInsertPluginRails::Rails::VERSION
  gem.authors       = ['Michael Lang']
  gem.email         = ['mwlang@cybrains.net']
  gem.summary       = %q{Medium Editor Insert Plugin integrated in Rails asset pipeline}
  gem.description   = gem.summary
  gem.homepage      = 'https://github.com/mwlang/medium-editor-insert-plugin-rails'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ['lib']

  gem.add_dependency 'railties', '>= 4.0'
  gem.add_development_dependency 'bundler', '~> 1.0'
end
