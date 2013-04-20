# -*- coding: utf-8; mode: ruby  -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'status_response/version'

Gem::Specification.new do |gem|
  gem.name          = "status_response"
  gem.version       = StatusResponse::VERSION
  gem.authors       = ["Conan Dalton"]
  gem.email         = ["conan@conandalton.net"]
  gem.description   = %q{Mixes a set of error-response methods into your ApplicationController}
  gem.summary       = %q{ Inserts :forbidden, :unauthorized, and :not_found methods into ApplicationController::Base }
  gem.homepage      = "https://github.com/conanite/status_response"

  gem.add_development_dependency 'rspec', '~> 2.9'
  gem.add_dependency             'rails', '>= 3.0'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
