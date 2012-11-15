require 'spec_helper'

describe "Conventers::BooleanConventer" do
  subject { Conventers::BooleanConventer.new }
  
  it { subject.convert.should == false }
  it { subject.convert('true').should == true }
  it { subject.convert('0').should == false }
  
  context "with default value" do
    subject { Conventers::BooleanConventer.new(default_value: true) }
    
    it { subject.convert.should == true }
  end
end
