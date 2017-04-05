class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :labs, :panels do |t|
      # t.index [:lab_id, :panel_id]
      # t.index [:panel_id, :lab_id]
    end
  end
end
