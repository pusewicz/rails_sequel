require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "rails_sequel"
    gem.summary = "Sequel plugin for Ruby on Rails"
    gem.description = "rails_sequel allows you to quickly use Sequel Toolkit as your ORM in Ruby on Rails"
    gem.email = "piotr@layer22.com"
    gem.homepage = "http://github.com/pusewicz/rails_sequel"
    gem.authors = ["Piotr Usewicz"]

    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

# require 'rake/testtask'
# Rake::TestTask.new(:test) do |test|
#   test.libs << 'lib' << 'test'
#   test.pattern = 'test/**/*_test.rb'
#   test.verbose = true
# end
# 
# begin
#   require 'rcov/rcovtask'
#   Rcov::RcovTask.new do |test|
#     test.libs << 'test'
#     test.pattern = 'test/**/*_test.rb'
#     test.verbose = true
#   end
# rescue LoadError
#   task :rcov do
#     abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
#   end
# end


# task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML.load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rails_sequel #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

