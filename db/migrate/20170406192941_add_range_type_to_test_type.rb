class AddRangeTypeToTestType < ActiveRecord::Migration
  def change
    add_column :test_types, :reference_type, :string
  end
end
