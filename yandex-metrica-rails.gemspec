# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yandex-metrica/version'

Gem::Specification.new do |spec|
  spec.name          = "yandex-metrica-rails"
  spec.version       = YandexMetrica::VERSION
  spec.authors       = ["Kirillov Alexander"]
  spec.email         = ["saratovsource@gmail.com"]
  spec.description   = %q{Rails 3 helpers to manage Yandex Metrica and other services.}
  spec.summary       = %q{Rails 3 helpers to manage Yandex Metrica and other services.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
