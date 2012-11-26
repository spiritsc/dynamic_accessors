require 'spec_helper'

describe "Conventers::TimeConventer" do
  let(:time) { Time.parse("2012-01-01 12:12:12") }
  subject { Conventers::TimeConventer.new }
  
  it { subject.convert.should be_nil }
  it { subject.convert((time - 1).to_s).should == (time - 1) }
  it { subject.convert((time - 1).to_s).should == (time - 1) }
  
  context "with default value" do
    subject { Conventers::TimeConventer.new(default_value: Proc.new { time.to_s }) }
    
    it { subject.convert.should == time }
  end
  
  context "with UTC" do
    subject { Conventers::TimeConventer.new(utc: true) }
    
    it { should be_utc }
    it { subject.convert(time.to_s).should == time.utc }
  end
end
