# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rails_sequel}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Piotr Usewicz"]
  s.date = %q{2009-10-09}
  s.description = %q{rails_sequel allows you to quickly use Sequel Toolkit as your ORM in Ruby on Rails}
  s.email = %q{piotr@layer22.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    ".document",
    ".gitignore",
    "LICENSE",
    "README.md",
    "Rakefile",
    "VERSION.yml",
    "init.rb",
    "lib/rails_sequel.rb",
    "lib/rails_sequel/rails_sequel.rb",
    "lib/rails_sequel/sequel_ext.rb",
    "lib/rails_sequel/version.rb",
    "rails_sequel.gemspec",
    "spec/config/database.yml",
    "spec/rails_sequel_spec.rb",
    "spec/sequel_ext_spec.rb",
    "spec/spec.opts",
    "spec/spec_helper.rb",
    "spec/version_spec.rb",
    "tasks/sequel.rake"
  ]
  s.homepage = %q{http://github.com/pusewicz/rails_sequel}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Sequel plugin for Ruby on Rails}
  s.test_files = [
    "spec/rails_sequel_spec.rb",
    "spec/sequel_ext_spec.rb",
    "spec/spec_helper.rb",
    "spec/version_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3
  end
end
