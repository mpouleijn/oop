require 'spec_helper'

describe OOP::Router do
  let(:route_hash) do
    [{
      :pattern => %r{^page1$},
      :controller => lambda do |env|
        [ 200, {'Content-Type' => 'text/html'}, 'page 1' ]
      end
    }]
  end
  
  subject { OOP::Router.new(route_hash) }
  
  describe "default routing errors" do
    it "404 - file not found" do
      assert_equal subject.file_not_found, [ 404, {'Content-Type' => 'text/plain'}, 'file not found' ]
    end
  end
  
  describe "route to page" do
    let(:env) { Hash.new }
    
    it "return file not found" do
      assert_equal [ 404, {'Content-Type' => 'text/plain'}, 'file not found' ], subject.call(env)
    end
  
    it "returns file not found when there where no routes given" do
      assert_equal [ 404, {'Content-Type' => 'text/plain'}, 'file not found' ], OOP::Router.new.call(env)
    end
  
    it "return status 200 when page is succesfully loaded" do
      env['REQUEST_PATH'] = 'page1'
      assert_equal [ 200, {'Content-Type' => 'text/html'}, 'page 1' ], subject.call(env)
    end
    
    it "return status 200 when multiple routes are given" do
      route_hash << {
        :pattern => %r{^page2$},
        :controller => lambda do |env|
          [ 200, {'Content-Type' => 'text/html'}, 'page 2' ]
        end
      }
      
      env['REQUEST_PATH'] = 'page1'
      assert_equal [ 200, {'Content-Type' => 'text/html'}, 'page 1' ], subject.call(env)
      
      env['REQUEST_PATH'] = 'page2'
      assert_equal [ 200, {'Content-Type' => 'text/html'}, 'page 2' ], subject.call(env)
    end
  end
end