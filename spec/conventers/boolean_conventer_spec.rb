require 'spec_helper'

describe "Conventers::BooleanConventer" do
  subject { Conventers::BooleanConventer.new }
  
  it { subject.convert.should be(false) }
  it { subject.convert('true').should be(true) }
  it { subject.convert('0').should be(false) }
  
  context "with default value" do
    subject { Conventers::BooleanConventer.new(default_value: value) }
    
    context "as TRUE" do
      let(:value) { true }
      
      it { subject.convert.should be(true) }
      it { subject.convert(true).should be(true) }
      it { subject.convert("1").should be(true) }
      it { subject.convert(false).should be(false) }
      it { subject.convert("0").should be(false) }
    end
    
    context "as FALSE" do
      let(:value) { false }
      
      it { subject.convert.should be(false) }
      it { subject.convert(true).should be(true) }
      it { subject.convert("1").should be(true) }
      it { subject.convert(false).should be(false) }
      it { subject.convert("0").should be(false) }
    end
  end
end
