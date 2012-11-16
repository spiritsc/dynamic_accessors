require 'spec_helper'

describe "Conventers::StringConventer" do
  subject { Conventers::StringConventer.new }
  
  it { subject.convert.should be_nil }
  it { subject.convert("").should be_nil }
  it { subject.convert(1).should == "1" }
  
  context "with default value" do
    subject { Conventers::StringConventer.new(default_value: "ABC") }
    
    it { subject.convert.should == "ABC" }
  end
end