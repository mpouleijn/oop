require 'rubygems'
require 'bundler/setup'
Bundler.require :default, :test

require 'capybara/dsl'
Capybara.app = OOP.new

class IntegrationTest < MiniTest::Spec
  include Capybara::DSL
  register_spec_type(/integration$/, self)
end

Turn.config.format = :dot