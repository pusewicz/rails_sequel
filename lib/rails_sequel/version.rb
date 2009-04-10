module RailsSequel
  # Returns current plugin version
  def self.version
    return @version if @version
    config = YAML.load(File.read(File.join(File.dirname(__FILE__), '../../VERSION.yml')))
    @version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  end
end