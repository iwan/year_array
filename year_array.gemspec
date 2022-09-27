
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "year_array/version"

Gem::Specification.new do |spec|
  spec.name          = "year_array"
  spec.version       = YearArray::VERSION
  spec.authors       = ["Iwan Buetti"]
  spec.email         = ["iwan.buetti@gmail.com"]

  spec.summary       = "Just an array wrapper to manage 8760 (or 8784) hourly values related to a year"
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/iwan/year_array"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.3"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.11"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_dependency "activesupport", "~> 7.0"
  spec.add_development_dependency 'coveralls', "~> 0.8"
  spec.add_development_dependency 'memory_profiler', "~> 1.0"
end
