module Conventers
  class StringConventer < Conventers::BaseConventer
    
  private
    def value_present?(value)
      super && value.to_s != ""
    end
  
    def execute(value=nil)
      value.to_s
    end
  end
end
