require 'spec_helper'

describe "Conventers::CustomConventer" do
  let(:process) { Proc.new { |d| Bar.new(d) } }
  subject { Conventers::CustomConventer.new(process: process) }
  
  it "should raise errors without given process" do
    lambda { Conventers::CustomConventer.new }.should raise_error("Empty :process option!")
  end
  
  it { subject.convert.should be_nil }
  it { subject.convert({}).should_not be_nil }
  it { subject.convert({}).should be_instance_of(Bar) }
  it { subject.convert({bar_login: "Bar"}).should be_instance_of(Bar) }
  it { subject.convert({bar_login: "Bar"}).bar_login.should == "Bar" }
  
  context "with default value" do
    subject { Conventers::CustomConventer.new(process: process, default_value: Proc.new { Bar.new(bar_login: "Foo") }) }
    
    it { subject.convert.should be_instance_of(Bar) }
    it { subject.convert.bar_login.should == "Foo" }
    it { subject.convert({bar_login: "Baz"}).bar_login.should == "Baz" }
  end
end
