require 'spec_helper'

describe 'DynamicAccessors' do
  subject { Foo }
  
  it { should respond_to(:string) }
  it { should respond_to(:integer) }
  it { should respond_to(:date) }
  it { should respond_to(:time) }
  it { should respond_to(:boolean) }
  it { should respond_to(:enum) }
  it { should respond_to(:field) }
  
  context "instance" do
    subject { Foo.new }
    
    it { should respond_to(:name) }
    it { should respond_to(:name=) }
    
    it { subject.login.should == "Bar" }
    
    it "should set string value" do
      subject.name = 1
      subject.name.should == "1"
      subject.name = nil
      subject.name.should be_nil
      subject.name = ""
      subject.name.should be_nil
    end
    
    it "should set integer value" do
      subject.age = 18
      subject.age.should == 18
      subject.age = nil
      subject.age.should be_nil
      subject.age = ""
      subject.age.should be_nil
    end
    
    it "should set string value with float type" do
      subject.weight = 75
      subject.weight.should == 75.0
      subject.weight = nil
      subject.weight.should be_nil
    end
    
    it "should set date value" do
      subject.born_at = Date.today.to_s
      subject.born_at.should == Date.today
      subject.born_at = Date.today
      subject.born_at.should == Date.today
      subject.born_at = Time.now
      subject.born_at.should == Date.today
    end
    
    it "should raise error when set date with nil value" do
      lambda { subject.born_at = nil }.should raise_error
    end
    
    it "should set time value" do
      _time = Time.parse("2012-11-10 00:01:02")
      subject.created_at = Date.parse("2012-11-10")
      subject.created_at.should == Time.parse("2012-11-10 00:00:00")
      subject.created_at = _time
      subject.created_at.should == _time
    end
    
    it "should raise error when set date with nil value" do
      lambda { subject.created_at = nil }.should raise_error
    end
    
    it "should set time value with UTC" do
      subject.updated_at = Date.parse("2012-11-10")
      subject.updated_at.should == Time.parse("2012-11-10 00:00:00")
      subject.updated_at = Time.new(2012, 11, 10, 0, 1, 2, "+05:00")
      subject.updated_at.should == Time.new(2012, 11, 9, 20, 1, 2, "+01:00").utc
    end
    
    it "should set boolean value" do
      subject.admin = true
      subject.admin.should be_true
      subject.admin = "Foo"
      subject.admin.should be_false
      subject.admin = nil
      subject.admin.should be_false
    end
    
    it "should set enum value" do
      subject.sex = "male"
      subject.sex.should == "male"
      subject.sex = "Foo"
      subject.sex.should be_nil
      subject.sex = nil
      subject.sex.should be_nil
    end
    
    it "should set string value" do
      subject.homepage = "http://google.com"
      subject.homepage == "http://google.com"
      subject.homepage = nil
      subject.homepage.should be_nil
      subject.homepage = ""
      subject.homepage.should be_nil
    end
    
    it "should set array value" do
      subject.post_ids = "1, 2, 3"
      subject.post_ids == ["1", "2", "3"]
      subject.post_ids = nil
      subject.post_ids.should == []
      subject.post_ids = ""
      subject.post_ids.should == []
      subject.comment_ids = "4, 5"
      subject.comment_ids.should == [4, 5]
    end
  end
end
