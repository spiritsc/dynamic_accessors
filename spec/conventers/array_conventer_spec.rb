require 'spec_helper'

describe "Conventers::ArrayConventer" do
  subject { Conventers::ArrayConventer.new }
  
  it { subject.convert.should == [] }
  it { subject.convert("").should == [] }
  it { subject.convert("1, 2,3").should == ["1", "2", "3"] }
  it { subject.convert([]).should == [] }
  it { subject.convert({}).should == [] }
  
  context "with default value" do
    subject { Conventers::ArrayConventer.new(default_value: [1, 2, 3]) }
    
    it { subject.convert.should == [1, 2, 3] }
  end
  
  context "with process" do
    subject { Conventers::ArrayConventer.new(process: :integer) }
    
    it { subject.convert("1, 2,3").should == [1, 2, 3] }
  end
end