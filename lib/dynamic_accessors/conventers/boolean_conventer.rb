module Conventers
  class BooleanConventer < Conventers::BaseConventer
    VALUES = {
      true    => true,
      false   => false,
      'true'  => true,
      'false' => false,
      'TRUE'  => true,
      'FALSE' => false,
      '1'     => true,
      '0'     => false,
      'yes'   => true,
      'no'    => false,
      'YES'   => true,
      'NO'    => false,
      'ON'    => true,
      'OFF'   => false
    }

  private
    def execute(value=nil)
      VALUES.keys.include?(value) ? VALUES[value] : false
    end
  end
end
