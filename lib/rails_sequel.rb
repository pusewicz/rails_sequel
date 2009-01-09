module Rails
  module SequelConnection
    @@config = YAML::load(ERB.new(IO.read(Rails.root + "/config/database.yml")).result)[Rails.env].with_indifferent_access
    
    def self.connect
      Sequel.connect uri
    end
    
    def self.uri
      uri = @@config[:adapter] << "://"
      uri << @@config[:username] if @@config[:username]
      uri << ':' << @@config[:password] if @@config[:password]
      uri << '@' if @@config[:username] || @@config[:password]
      uri << ':' << @@config[:port] if @@config[:port]
      uri << @@config[:host]
      uri << '/' << @@config[:database]
    end
  end
end