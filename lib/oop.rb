require "rubygems"
require "bundler/setup"
require 'pathname'

APP_PATH = Pathname.new(__FILE__).dirname + "../"

class OOP
	VERSION = "0.0.1"

  autoload :Router, 'oop/router'
  autoload :Controller,	'oop/controller'

  def initialize(options = {})
    # @app = OOP::Router.new(
    # 	[{
    #   :pattern => %r{^post$},
    #   :controller => Controller::Post::Index
    # }])
@app = Rack::URLMap.new(
      "/" => Controller::Post::Index
    )
  end

  def call(*args)
    @app.call(*args)
  end
end
