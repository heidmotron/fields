# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fields/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Matthew Heidemann"]
  gem.email         = ["matthew.heidemann@gmail.com"]
  gem.description   = %q{A Parser for a nested schema fields}
  gem.summary       = ""
  gem.homepage      = "https://github.com/heidmotron/fields"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "fields"
  gem.require_paths = ["lib"]
  gem.version       = Fields::VERSION
end
