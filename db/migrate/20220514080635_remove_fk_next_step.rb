class RemoveFkNextStep < ActiveRecord::Migration[6.1]
  def change
    remove_index :steps, name: "index_steps_on_next1_id"
    remove_index :steps, name: "index_steps_on_next2_id"
  end
end
