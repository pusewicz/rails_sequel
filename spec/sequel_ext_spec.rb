require File.join(File.dirname(__FILE__), 'spec_helper')
require 'rails_sequel/sequel_ext'

class TestModel < Sequel::Model
end

describe Sequel::Model, '#id' do
  before(:all) do
    @model = TestModel.create
  end
  
  it "to_params returns id as a string" do
    @model.to_param.should == '1'
  end
end

describe Sequel::Model, '#new_record?' do
  before(:all) do
    @model = TestModel.new
  end
  
  it "behaves like new?" do
    @model.new_record?.should === @model.new?
    @model.save
    @model.new_record?.should === @model.new?
  end
end