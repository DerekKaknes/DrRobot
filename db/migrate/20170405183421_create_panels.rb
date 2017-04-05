class CreatePanels < ActiveRecord::Migration
  def change
    create_table :panels do |t|
      t.string :name
      t.string :description
      t.string :text

      t.timestamps null: false
    end
  end
end
