require 'bundler/setup'
require 'active_record'
require 'simplecov'
require 'coveralls'
Coveralls.wear!

ENV["COVERAGE"] = "true"
SimpleCov.start if ENV["COVERAGE"]

Bundler.require

MiniTest::Unit.autorun
