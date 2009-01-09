class Sequel::Model
  def to_param
    pk.to_s
  end
end