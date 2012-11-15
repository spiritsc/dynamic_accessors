module Conventers
  class DateConventer < Conventers::BaseConventer
    
  private
    def execute(value=nil)
      case
      when value.is_a?(String)
        Date.parse(value)
      when value.is_a?(Date)
        value
      when value.is_a?(Time)
        value.to_date
      else
        raise "Invalid date value"
      end
    rescue
      raise "Invalid date value"
    end
  end
end
