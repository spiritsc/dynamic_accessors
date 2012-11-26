# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dynamic_accessors/version'

Gem::Specification.new do |gem|
  gem.name          = "dynamic_accessors"
  gem.version       = DynamicAccessors::VERSION
  gem.authors       = ["Szymon Czarnecki"]
  gem.email         = ["spirit_sc@thinkdifferent.pl"]
  gem.description   = %q{Simple way to define accessors with type}
  gem.summary       = %q{Simple way to define accessors with type}
  gem.homepage      = "https://github.com/spiritsc/dynamic_accessors"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "guard"
  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "rb-fsevent"
  gem.add_development_dependency "simplecov"
end
