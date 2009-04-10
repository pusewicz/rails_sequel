require File.join(File.dirname(__FILE__), 'spec_helper')
require 'rails_sequel'

describe RailsSequel do
  it "can reset config" do
    RailsSequel.config.should_not be_nil
    RailsSequel.config.should == RailsSequel.instance_variable_get(:@config)
    RailsSequel.reset_config!
    RailsSequel.instance_variable_get(:@config).should be_nil
  end
end

describe RailsSequel, '#config' do  
  before(:each) do
    RailsSequel.reset_config!
  end
  
  it "reads values for current environment" do
    RailsSequel.config.should == {
      "adapter" => 'sqlite',
      "database" => 'db/test.sqlite3'
    }
  end
  
  describe "MySQL" do
    it "recognizes database options" do
      Rails.stub!(:env).and_return("mysql")
      RailsSequel.config.should == {
        "adapter" => "mysql",
        "database" => "henry",
        "hostname" => "john",
        "username" => "piotr",
        "password" => "usewicz",
        "charset" =>"brilliant",
        "encoding" => "ascii",
        "socket" => "/var/run/my.socket"
      }
    end
  end
  
  describe "MSSQL" do
    it "recognizes database options" do
      Rails.stub!(:env).and_return("mssql")
      RailsSequel.config.should == {
        "db_type" => "sometype"
      }
    end
  end
end

describe RailsSequel, "#connect" do
  before(:each) do
    RailsSequel.reset_config!
  end
  
  it "returns connection" do
    Sequel.stub!(:connect).and_return(MODEL_DB)
    RailsSequel.connect.should == MODEL_DB
  end
  
  it "connects with configuration loaded from file" do
    options = RailsSequel.prepare_options
    RailsSequel.should_receive(:prepare_options).and_return(options)
    Sequel.should_receive(:connect).with(options)
    RailsSequel.connect
  end
  
  it "sets SQL_AUTO_IS_NULL if adapter is MySQL" do
    Rails.stub!(:env).and_return('test_mysql')
    Sequel.stub!(:connect).and_return(MODEL_DB)
    RailsSequel.connect
    MODEL_DB.sqls.should include("SET SQL_AUTO_IS_NULL=0")
  end
end
