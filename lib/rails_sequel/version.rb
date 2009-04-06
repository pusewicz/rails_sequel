module Rails
  module SequelConnection
    config = YAML.load(File.read(File.join(File.dirname(__FILE__), '../../VERSION.yml')))
    VERSION = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
    
    def self.version
      VERSION
    end
  end
end