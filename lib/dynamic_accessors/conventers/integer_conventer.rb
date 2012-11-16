module Conventers
  class IntegerConventer < Conventers::BaseConventer
    
  private
    def execute(value=nil)
      options[:type] ||= :integer

      case options[:type]
      when :float
        value.to_f
      when :integer
        value.to_i
      end unless value.nil?
    end
  end
end
