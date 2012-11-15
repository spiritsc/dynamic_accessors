require 'spec_helper'

describe "Conventers::BaseConventer" do
  subject { Conventers::BaseConventer.new }
  
  it { should respond_to(:options) }
  it { should respond_to(:convert) }
end
