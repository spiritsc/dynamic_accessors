module Conventers
  class BaseConventer
    attr_accessor :options
    
    def initialize(options={})
      @options = options
    end

    def convert(value=nil)
      value ||= default_value
      value_present?(value) ? execute(value) : nil
    end
    
  private
    def value_present?(value)
      !value.nil?
    end
  
    def execute(value=nil)
      raise "Implement in subclass!"
    end
    
    def default_value
      default_value = options[:default_value]
      default_value.is_a?(Proc) ? default_value.call : default_value
    end
  end
end
