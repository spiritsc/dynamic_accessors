require 'bundler/setup'
require 'rspec/autorun'
require 'dynamic_accessors'

Bundler.setup(:test)

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end

class Foo
  include DynamicAccessors
  
  string  :name
  string  :login, default_value: "Bar"
  integer :age
  integer :weight, type: :float
  date    :born_at
  time    :created_at
  time    :updated_at, utc: true
  boolean :admin
  enum    :sex, values: ["male", "female"]
  field   :homepage, as: :string
  array   :post_ids
  array   :comment_ids, process: :integer
end
