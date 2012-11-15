require 'dynamic_accessors/version'
require 'dynamic_accessors/conventer'

module DynamicAccessors
  def self.included(base)
    base.extend Conventer
  end
end
