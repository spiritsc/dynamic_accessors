module Conventers
  class CustomConventer < Conventers::BaseConventer
    attr_accessor :process
    
    def initialize(options={})
      raise "Empty :process option!" unless options.has_key?(:process)
      @process = options[:process]
      super
    end
    
    def convert(value=nil)
      execute(value)
    end
    
  private
    def execute(value=nil)
      process.call(value)
    rescue
      default_value || nil
    end
  end
end
