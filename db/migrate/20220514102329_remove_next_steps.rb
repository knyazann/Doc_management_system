class RemoveNextSteps < ActiveRecord::Migration[6.1]
  def change
    remove_column :steps, :next1
    remove_column :steps, :next2
  end
end
