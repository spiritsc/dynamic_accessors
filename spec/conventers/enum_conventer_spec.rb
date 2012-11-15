require 'spec_helper'

describe "Conventers::EnumConventer" do
  subject { Conventers::EnumConventer.new(values: ["on", "off"]) }
  
  it "should raise errors without given values" do
    lambda { Conventers::EnumConventer.new }.should raise_error("Empty :values option in enum field!")
  end
  
  it { subject.convert.should == nil }
  it { subject.convert('on').should == 'on' }
  
  context "with default value" do
    subject { Conventers::EnumConventer.new(values: ["on", "off"], default_value: 'off') }
    
    it { subject.convert.should == 'off' }
  end
  
  context "with range values" do
    subject { Conventers::EnumConventer.new(values: 1..10) }
    
    it { subject.convert.should == nil }
    it { subject.convert(5).should == 5 }
  end
end
