# gem 'sequel'
require 'sequel'

require File.expand_path(File.dirname(__FILE__) + '/rails_sequel/rails_sequel')
require File.expand_path(File.dirname(__FILE__) + '/rails_sequel/version')
require File.expand_path(File.dirname(__FILE__) + '/rails_sequel/sequel_ext')

Rails::SequelConnection.connect