require 'spec_helper'

describe "Conventers::IntegerConventer" do
  subject { Conventers::IntegerConventer.new }
  
  it { subject.convert.should be_nil }
  it { subject.convert("").should be_nil }
  it { subject.convert(1).should == 1 }
  
  context "with default value" do
    subject { Conventers::IntegerConventer.new(default_value: 99) }
    
    it { subject.convert.should == 99 }
  end
  
  context "with float type" do
    subject { Conventers::IntegerConventer.new(type: :float) }
    
    it { subject.convert(99).should == 99.0 }
  end
end
