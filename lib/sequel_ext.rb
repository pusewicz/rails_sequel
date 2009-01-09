class Sequel::Model
  def to_param
    pk.to_s
  end
  
  def new_record?
    new?
  end
end