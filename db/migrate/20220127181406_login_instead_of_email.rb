class LoginInsteadOfEmail < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :email, :login
  end
end
