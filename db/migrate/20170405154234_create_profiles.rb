class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :firstname
      t.string :lastname
      t.string :gender, limit: 1
      t.date :date_of_birth
      t.string :ethnicity
      t.string :zip_code, limit: 10
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
