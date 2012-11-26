module Conventers
  class IntegerConventer < Conventers::BaseConventer
    
  private
    def value_present?(value)
      super && value.to_s != ""
    end
  
    def execute(value=nil)
      options[:type] ||= :integer

      case options[:type]
      when :integer
        value.to_i
      when :float
        value.to_f
      end
    end
  end
end
