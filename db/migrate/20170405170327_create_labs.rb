class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.references :user, index: true, foreign_key: true
      t.date :order_date
      t.date :collection_date
      t.date :report_date
      t.string :requesting_physician
      t.references :laboratory, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
