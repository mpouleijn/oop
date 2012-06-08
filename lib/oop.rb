require "rubygems"
require "bundler/setup"
require 'pathname'

require "oop/version"

APP_PATH = Pathname.new(__FILE__).dirname + "../"

module OOP
  autoload :Router, 'oop/router'
  autoload :Controller,	'oop/controller'
end
