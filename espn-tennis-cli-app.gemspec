# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "espn-tennis-cli-app"
  spec.version       = "0.0.1"
  spec.authors       = ["Sophia Varella"]
  spec.email         = ["sophiavarella@gmail.com"]

  spec.summary       = %q{ESPN Tennis rankings}
  spec.description   = %q{Gets ATP/WTA Rankings and player bios from the ESPN website}
  spec.homepage      = "https://github.com/sophiav/espn-tennis-cli-app"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ["espn-tennis"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "nokogiri", "~> 1.7"
  spec.add_runtime_dependency "require_all", "~> 1.4"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "pry", "~> 0.10"
end
