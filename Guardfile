# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'yard' do
  watch(%r{lib/.+\.rb})
end

guard 'minitest' do
  watch(%r|^spec/(.*)_spec\.rb|)
  watch(%r|^lib/oop\.rb|)			  { "spec" }
  watch(%r|^lib/(.*)([^/]+)\.rb|)     { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r|^spec/spec_helper\.rb|)    { "spec" }
end