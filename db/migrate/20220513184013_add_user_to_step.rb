class AddUserToStep < ActiveRecord::Migration[6.1]
  def change
    add_reference :steps, :user, foreign_key: true
  end
end
