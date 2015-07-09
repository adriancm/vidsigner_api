# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vidsigner_api/version'

Gem::Specification.new do |spec|
  spec.name          = "vidsigner_api"
  spec.version       = VidsignerApi::VERSION
  spec.authors       = ["Adrian Cepillo"]
  spec.email         = ["adrian.cepillo@gmail.com"]
  spec.summary       = %q{Ruby gem for VidSigner API service}
  spec.description   = %q{Ruby gem for VidSigner API service}
  spec.homepage      = "http://github.com/adriancm/vidsigner_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
