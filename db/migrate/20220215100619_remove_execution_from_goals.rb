class RemoveExecutionFromGoals < ActiveRecord::Migration[6.1]
  def change
    remove_column :goals, :execution, :string
  end
end
