class AddDescriptionToGoals < ActiveRecord::Migration[6.1]
  def change
    add_column :goals, :description, :string
  end
end
