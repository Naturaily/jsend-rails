# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jsend-rails/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'jsend-rails'
  s.version = JSend::Rails::VERSION.dup
  s.authors = ['Brian Moseley']
  s.email = ['bcm@maz.org']
  s.homepage = 'http://github.com/bcm/jsend-rails'
  s.description = 'Extensions to Rails for rendering JSend responses'
  s.summary = 'Extends Rails to render JSON responses in the JSend format'

  s.add_dependency "rails", ">= 5.0.0"
  s.add_development_dependency('rspec')

  s.require_path = 'lib'
  s.files = Dir.glob("lib/**/*") + %w(README.md)
end
