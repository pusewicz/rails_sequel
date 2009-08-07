module RailsSequel

  # Connects to database using constructed Database Connection URI
  def self.connect
    connection = Sequel.connect(options = self.prepare_options)
    if options[:adapter] == 'mysql'
      connection.execute("SET SQL_AUTO_IS_NULL=0")
    end
    connection
  end

  # Returns loaded database.yml configuration for current environment
  def self.config
    @config ||= YAML::load(ERB.new(IO.read(File.join(Rails.root, "config", "database.yml"))).result)[Rails.env].with_indifferent_access
  end

  # Resets config
  def self.reset_config!
    @config = nil
  end

  # Constructs Database Connection URI
  def self.prepare_options
    options = {}

    # Use SQLite by default
    options[:adapter]   = config[:adapter] || "sqlite"

    # Use localhost as default host
    options[:host]      = config[:host] || config[:hostname] || "localhost"

    # Default user is an empty string. Both username and user keys are supported.
    options[:user]      = config[:username] || config[:user] || ""
    options[:password]  = config[:password] || ""

    # Both encoding and charset options are supported, default is utf8
    options[:encoding]  = config[:encoding] || config[:charset] || "utf8"

    # Default database is hey_dude_configure_your_database
    options[:database]  = config[:database] || "hey_dude_configure_your_database"

    # MSSQL support
    [:db_type, :socket, :charset, :encoding].each do |var|
      options[var]      = config[var] if config[var]
    end

    # JDBC support
    [:url, :uri].each do |var|
      options[var]      = config[var] if config[var]
    end

    options[:loggers]   = [Rails.logger]
    options
  end
end