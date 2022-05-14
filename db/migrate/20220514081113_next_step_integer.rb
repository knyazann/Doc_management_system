class NextStepInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :steps, :next1_id, :integer
    change_column :steps, :next2_id, :integer
  end
end
