class OOP::Router
  def initialize routes = Array.new
    @routes ||= routes
  end
  
  def file_not_found
    [ 404, { 'Content-Type' => 'text/plain' }, 'file not found' ]
  end
  
  def call env
    return file_not_found if env.empty?

    @routes.each do |route|
      match = !!env['PATH_INFO'].match( route[:pattern] )
      return route[:controller].call( env ) if match
    end

    return file_not_found
  end
end