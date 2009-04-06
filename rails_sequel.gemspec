# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rails_sequel}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Piotr Usewicz"]
  s.date = %q{2009-04-06}
  s.description = %q{rails_sequel allows you to quickly use Sequel Toolkit as your ORM in Ruby on Rails}
  s.email = %q{piotr@layer22.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    "LICENSE",
    "README.md",
    "Rakefile",
    "VERSION.yml",
    "lib/rails_sequel.rb",
    "lib/rails_sequel/rails_sequel.rb",
    "lib/rails_sequel/sequel_ext.rb",
    "lib/rails_sequel/version.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/pusewicz/rails_sequel}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Sequel plugin for Ruby on Rails}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
