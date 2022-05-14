class RenameStepType < ActiveRecord::Migration[6.1]
  def change
    rename_column :steps, :type, :step_type
  end
end
