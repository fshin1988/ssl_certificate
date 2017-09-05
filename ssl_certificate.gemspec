# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ssl_certificate/version"

Gem::Specification.new do |spec|
  spec.name          = "ssl_certificate"
  spec.version       = SslCertificate::VERSION
  spec.authors       = ["fujishin05"]
  spec.email         = ["noalv88@gmail.com"]

  spec.summary       = %q{Wrapper of OpenSSL::X509::Certificate}
  spec.description   = %q{Wrapper of OpenSSL::X509::Certificate}
  spec.homepage      = "https://github.com/fshin1988/ssl_certificate"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
