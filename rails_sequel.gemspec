require 'rails_sequel/version'

Gem::Specification.new do |s|
  s.name    = 'rails_sequel'
  # Change VERSION too
  s.version = "0.1.2"
  s.date    = '2009-01-14'
  
  s.summary = "Sequel plugin for Ruby on Rails"
  s.description = "rails_sequel allows you to quickly use Sequel Toolkit as your ORM in Ruby on Rails"
  
  s.authors  = ['Piotr Usewicz']
  s.email    = 'piotr@layer22.com'
  s.homepage = 'http://github.com/pusewicz/rails_sequel/wikis'
  
  s.has_rdoc = false
  # s.rdoc_options = ['--main', 'README.rdoc']
  # s.rdoc_options << '--inline-source' << '--charset=UTF-8'
  # s.extra_rdoc_files = ['README.rdoc', 'LICENSE', 'CHANGELOG.rdoc']
  
  s.files = ["lib/rails_sequel/rails_sequel.rb", "lib/rails_sequel/sequel_ext.rb", "lib/rails_sequel/version.rb", "lib/rails_sequel.rb", "init.rb", "README.md"]
  # Dir['lib/**/*.rb'] + Dir['init.rb'] + Dir['README.md']
  
  s.add_dependency("sequel", [">= 2.8.0"])
end
