gem 'sequel'
require 'sequel'
require File.expand_path(File.dirname(__FILE__) + '/lib/rails_sequel')
Rails::SequelConnection.connect