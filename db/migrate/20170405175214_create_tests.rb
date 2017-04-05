class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.references :lab, index: true, foreign_key: true
      t.references :test_type, index: true, foreign_key: true
      t.float :value

      t.timestamps null: false
    end
  end
end
