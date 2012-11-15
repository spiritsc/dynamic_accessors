module Conventers
  class StringConventer < Conventers::BaseConventer
    
  private
    def execute(value=nil)
      value.to_s
    end
  end
end
