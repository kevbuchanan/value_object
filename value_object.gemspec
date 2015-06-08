Gem::Specification.new do |spec|
  spec.name          = "value_object"
  spec.version       = "1.0.0"
  spec.authors       = ["Kevin Buchanan"]
  spec.homepage      = "https://github.com/kevinbuch/value_object"
  spec.summary       = "Ruby value object"
  spec.description   = "Ruby value object"

  spec.files         = Dir['lib/**/*.rb']
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rspec', '~> 3.0'
end
