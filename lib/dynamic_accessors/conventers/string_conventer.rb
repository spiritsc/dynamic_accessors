module Conventers
  class StringConventer < Conventers::BaseConventer
    
  private
    def execute(value=nil)
      value.to_s unless value.nil?
    end
  end
end
