
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gardening/version"

Gem::Specification.new do |spec|
  spec.name          = "gardening"
  spec.version       = Gardening::VERSION
  spec.authors       = ["'Amanda Ackerman'"]
  spec.email         = ["'ackerm44@gmail.com'"]

  spec.summary       = %q{The Gardening app provides instructions and information for growing vegetables at home.}
  spec.description   = %q{This gem will provide you with instructions and information on growing a variety of vegetables at your own home.  All vegetables listings will provide an overview of the plant, recommended varieties, cold tolerance, required sun, germination soil temperature or planting recommendations, the amount of time until harvest, and additional information on the plant.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
end
