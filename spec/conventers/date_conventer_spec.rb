require 'spec_helper'

describe "Conventers::DateConventer" do
  subject { Conventers::DateConventer.new }
  
  it "should raise error when given nil value" do
    lambda { subject.convert }.should raise_error("Invalid date value")
  end
  
  it { subject.convert(Date.today - 1).should == (Date.today - 1) }
  it { subject.convert((Date.today - 1).to_s).should == (Date.today - 1) }
  
  it "should convert Time to Date" do
    subject.convert(Time.now).should == Date.today
  end
  
  context "with default value" do
    subject { Conventers::DateConventer.new(default_value: Proc.new { Date.today.to_s }) }
    
    it { subject.convert.should == Date.today }
  end
end
