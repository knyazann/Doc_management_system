class AddDecisionToParticipants < ActiveRecord::Migration[6.1]
  def change
    add_column :participants, :decision, :string
  end
end
