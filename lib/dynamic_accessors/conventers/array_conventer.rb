module Conventers
  class ArrayConventer < Conventers::BaseConventer
    
  private
    def execute(value=nil)
      case value
      when Array
        value
      when Hash
        value.to_a
      when String
        options[:delimeter] ||= ","
        values = value.split(options.delete(:delimeter)).map(&:strip)
        if options.has_key?(:process)
          conventer = Conventers.define_dynamic_accessor_class(options.delete(:process)).new(options)
          values = values.map { |v| conventer.convert(v) }
        end
        values
      else
        []
      end
    end
  end
end