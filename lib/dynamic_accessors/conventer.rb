require 'dynamic_accessors/conventers'
require 'dynamic_accessors/conventers/base_conventer'
require 'dynamic_accessors/conventers/string_conventer'
require 'dynamic_accessors/conventers/integer_conventer'
require 'dynamic_accessors/conventers/date_conventer'
require 'dynamic_accessors/conventers/time_conventer'
require 'dynamic_accessors/conventers/boolean_conventer'
require 'dynamic_accessors/conventers/enum_conventer'
require 'dynamic_accessors/conventers/array_conventer'
require 'dynamic_accessors/conventers/custom_conventer'

module Conventer
  [:string, :integer, :date, :time, :boolean, :enum, :array, :custom].each do |m|
    define_method m do |*args|
      define_dynamic_accessor(m, *args)
    end
  end
  
  def field(*args)
    options = args.last.is_a?(Hash) ? args.pop : {}
    define_dynamic_accessor(options.delete(:as), *args << options)
  end
  
private
  def define_dynamic_accessor(type, *args)
    klass     = define_dynamic_accessor_class(type.to_sym)
    options   = args.last.is_a?(Hash) ? args.pop : {}
    conventer = klass.new(options)

    args.flatten.each do |field|
      self.class_eval do
        define_method field do
          self.send("#{field}=", conventer.convert) unless instance_variable_defined?("@#{field}")
          instance_variable_get("@#{field}")
        end

        define_method "#{field}=" do |value|
          instance_variable_set("@#{field}", conventer.convert(value))
        end
      end
    end
  end

  def define_dynamic_accessor_class(type)
    Conventers.define_dynamic_accessor_class(type)
  end
end