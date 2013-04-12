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
        Time.respond_to?(:zone) ? Time.zone.parse(value) : Time.parse(value)
      when value.is_a?(Time)
        Time.respond_to?(:zone) ? Time.zone.parse(value.to_s) : value
      when value.is_a?(Date)
        Time.respond_to?(:zone) ? Time.zone.parse(value.to_s) : Time.parse(value.to_s)
      end
      utc? ? _value.utc : _value
    rescue
      raise "Invalid time value"
    end
  end
end
