class AddNumToDepartments < ActiveRecord::Migration[6.1]
  def change
    add_column :departments, :dep_code, :string
  end
end
