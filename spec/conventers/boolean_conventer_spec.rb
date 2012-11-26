require 'spec_helper'

describe "Conventers::BooleanConventer" do
  subject { Conventers::BooleanConventer.new }
  
  it { subject.convert.should be(false) }
  it { subject.convert('true').should be(true) }
  it { subject.convert('0').should be(false) }
  
  context "with default value" do
    subject { Conventers::BooleanConventer.new(default_value: true) }
    
    it { subject.convert.should be(true) }
  end
end
