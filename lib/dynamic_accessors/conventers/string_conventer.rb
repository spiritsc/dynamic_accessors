module Conventers
  class StringConventer < Conventers::BaseConventer
    
  private
    def execute(value=nil)
      value.to_s unless value.to_s.empty?
    end
  end
end
