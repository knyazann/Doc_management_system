class AddInfoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :integer
    add_column :users, :surname, :string
    add_column :users, :name, :string
    add_column :users, :patronymic, :string
    add_column :users, :phone, :string
    add_column :users, :email, :string
    add_column :users, :post, :string
  end
end
