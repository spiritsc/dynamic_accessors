module Conventers
  class EnumConventer < Conventers::BaseConventer
    attr_accessor :values
    
    def initialize(options={})
      raise "Empty :values option in enum field!" unless options.has_key?(:values)
      @values = options[:values].to_a
      super
    end

  private
    def execute(value=nil)
      value if values.include?(value)
    end
  end
end
