class OOP::Controller::Post

	class Index
		def self.call(env)
      request = Rack::Request.new(env)

      [200, {'Content-Type' => 'text/html'}, "12345"]
    end
	end

	
end