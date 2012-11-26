module Conventers
  def self.define_dynamic_accessor_class(type)
    case type
    when :string
      Conventers::StringConventer
    when :integer
      Conventers::IntegerConventer
    when :date
      Conventers::DateConventer
    when :time
      Conventers::TimeConventer
    when :boolean
      Conventers::BooleanConventer
    when :enum
      Conventers::EnumConventer
    when :array
      Conventers::ArrayConventer
    when :custom
      Conventers::CustomConventer
    else
      raise "Uknown type of accessor!"
    end
  end
end