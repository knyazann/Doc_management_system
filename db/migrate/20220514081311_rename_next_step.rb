class RenameNextStep < ActiveRecord::Migration[6.1]
  def change
    rename_column :steps, :next1_id, :next1
    rename_column :steps, :next2_id, :next2
  end
end
