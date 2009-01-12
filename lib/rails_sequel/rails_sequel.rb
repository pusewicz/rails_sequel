module Rails
  module SequelConnection
    # Load configuration for current environment
    CONFIG = YAML::load(ERB.new(IO.read(Rails.root + "/config/database.yml")).result)[Rails.env].with_indifferent_access unless defined?(CONFIG)
    
    # Connects to database using constructed Database Connection URI
    def self.connect
      Sequel.connect(self.options)
    end
    
    # Returns loaded database.yml configuration for current environment
    def self.config
      CONFIG
    end
    
    # Constructs Database Connection URI
    def self.options
      options = {}

      # Use SQLite by default
      options[:adapter] = (CONFIG[:adapter] || "sqlite")
      # Use localhost as default host
      options[:host] = (CONFIG[:host] || "localhost")
      # Default user is an empty string. Both username and user keys are supported.
      options[:user] = (CONFIG[:username] || config[:user] || "")

      options[:password] = CONFIG[:password] || ""

      # Both encoding and charset options are supported, default is utf8
      options[:encoding] = (CONFIG[:encoding] || CONFIG[:charset] || "utf8")
      # Default database is hey_dude_configure_your_database
      options[:database] = CONFIG[:database] || "hey_dude_configure_your_database"
      # MSSQL support
      options[:db_type] = CONFIG[:db_type] if CONFIG[:db_type]
      options[:logger] = Rails.logger
      options
    end
  end
end