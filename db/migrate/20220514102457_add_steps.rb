class AddSteps < ActiveRecord::Migration[6.1]
  def change
    add_column :steps, :next_step1, :integer
    add_column :steps, :next_step2, :integer
  end
end
