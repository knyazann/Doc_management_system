class AddExecutionToGoals < ActiveRecord::Migration[6.1]
  def change
    add_column :goals, :execution, :boolean
  end
end
