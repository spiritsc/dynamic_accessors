require 'time'

module Conventers
  class TimeConventer < Conventers::BaseConventer
    
  def utc?
    options[:utc] == true
  end
    
  private
    def execute(value=nil)
      _value = case 
      when value.is_a?(String)
        Time.parse(value)
      when value.is_a?(Time)
        value
      when value.is_a?(Date)
        Time.parse(value.to_s)
      end
      utc? ? _value.utc : _value
    rescue
      raise "Invalid time value"
    end
  end
end
