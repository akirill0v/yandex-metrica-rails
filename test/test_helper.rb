require 'rubygems'
require 'yandex-metrika-rails'
require 'test/unit'
require 'simplecov'
require 'coveralls'
Coveralls.wear!

ENV["COVERAGE"] = "true"
SimpleCov.start if ENV["COVERAGE"]

YM.counter = "123"
class TestCase < MiniTest::Unit::TestCase
end
