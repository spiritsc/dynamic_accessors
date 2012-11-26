module Conventers
  class IntegerConventer < Conventers::BaseConventer
    
  private
    def execute(value=nil)
      options[:type] ||= :integer

      case options[:type]
      when :integer
        value.to_i
      when :float
        value.to_f
      end unless value.nil? || value == ""
    end
  end
end
