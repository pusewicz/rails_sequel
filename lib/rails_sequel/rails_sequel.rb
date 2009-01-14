module Rails
  module SequelConnection
    # Load configuration for current environment
    CONFIG = YAML::load(ERB.new(IO.read(Rails.root + "/config/database.yml")).result)[Rails.env].with_indifferent_access unless defined?(CONFIG)
    
    # Connects to database using constructed Database Connection URI
    def self.connect
      options = self.prepare_options
      connection = Sequel.connect(options)
      if options[:adapter] == 'mysql'
        connection.execute("SET SQL_AUTO_IS_NULL=0")
      end
    end
    
    # Returns loaded database.yml configuration for current environment
    def self.config
      CONFIG
    end
    
    # Constructs Database Connection URI
    def self.prepare_options
      options = {}

      # Use SQLite by default
      options[:adapter] = (config[:adapter] || "sqlite")
      # Use localhost as default host
      options[:host] = (config[:host] || "localhost")
      # Default user is an empty string. Both username and user keys are supported.
      options[:user] = (config[:username] || config[:user] || "")

      options[:password] = config[:password] || ""

      # Both encoding and charset options are supported, default is utf8
      options[:encoding] = (config[:encoding] || config[:charset] || "utf8")
      # Default database is hey_dude_configure_your_database
      options[:database] = config[:database] || "hey_dude_configure_your_database"
      # MSSQL support
      options[:db_type] = config[:db_type] if config[:db_type]
      options[:socket] = config[:socket] if config[:socket]
      options[:charset] = config[:charset] if config[:charset]
      options[:encoding] = config[:encoding] if config[:encoding]
      options[:loggers] = [Rails.logger]
      options
    end
  end
end