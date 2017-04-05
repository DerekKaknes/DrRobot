class CreateTestTypes < ActiveRecord::Migration
  def change
    create_table :test_types do |t|
      t.string :name, null: false
      t.text :description
      t.float :reference_range_low
      t.float :reference_range_high
      t.references :unit, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :test_types, :name, unique: true
  end
end
