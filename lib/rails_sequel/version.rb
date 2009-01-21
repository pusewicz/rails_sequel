module Rails
  module SequelConnection
    module Version
      MAJOR = 0
      MINOR = 1
      TINY  = 3

      STRING = [MAJOR, MINOR, TINY].join('.')
    end
    
    def self.version
      Version::STRING
    end
  end
end