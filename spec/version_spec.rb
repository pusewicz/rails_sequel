require File.join(File.dirname(__FILE__), 'spec_helper')
require 'rails_sequel/version'

describe RailsSequel, '#version' do
  it "returns correct version" do
    RailsSequel.version.should_not be_empty
    RailsSequel.version.should =~ /^\d.\d.\d$/
  end
end
