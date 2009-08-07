class Sequel::Model

  # Allows Rails resource path helpers to work correctly
  def to_param
    pk.to_s
  end

  # Make new? play nice with Rails
  def new_record?
    new?
  end
end