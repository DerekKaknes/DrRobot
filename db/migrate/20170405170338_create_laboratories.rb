class CreateLaboratories < ActiveRecord::Migration
  def change
    create_table :laboratories do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :laboratories, :name, unique: true
  end
end
