module Rails
  module SequelConnection
    # Load configuration for current environment
    CONFIG = YAML::load(ERB.new(IO.read(Rails.root + "/config/database.yml")).result)[Rails.env].with_indifferent_access unless defined?(CONFIG)
    
    # Connects to database using constructed Database Connection URI
    def self.connect
      Sequel.connect uri, :loggers => [Rails.logger]
    end
    
    # Returns loaded database.yml configuration for current environment
    def self.config
      CONFIG
    end
    
    # Constructs Database Connection URI
    def self.uri
      uri = config[:adapter] << "://"
      uri << config[:username] if config[:username]
      uri << ':' << config[:password] if config[:password]
      uri << '@' if config[:username] || config[:password]
      uri << ':' << config[:port] if config[:port]
      uri << (config[:host] || 'localhost')
      uri << '/' << config[:database]
    end
  end
end