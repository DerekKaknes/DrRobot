class CreateJoinTablePanelTestType < ActiveRecord::Migration
  def change
    create_join_table :panels, :test_types do |t|
      # t.index [:panel_id, :test_type_id]
      # t.index [:test_type_id, :panel_id]
    end
  end
end
