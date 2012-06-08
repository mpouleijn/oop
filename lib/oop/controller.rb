class OOP::Controller

	self_class_name = self.to_s.split('::').last.downcase
	Dir[APP_PATH + "lib/oop/#{self_class_name}/*.rb"].each do |file|
		class_name = file.split('/').last.gsub(/.rb/, '').capitalize
		autoload :"#{class_name}", "oop/#{self_class_name}/" + class_name.downcase
  end

end