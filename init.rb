gem 'sequel'
require 'sequel'
require File.expand_path(File.dirname(__FILE__) + '/lib/rails_sequel')
require File.expand_path(File.dirname(__FILE__) + '/lib/sequel_ext')
Rails::SequelConnection.connect