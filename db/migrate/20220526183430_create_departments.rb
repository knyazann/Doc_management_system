class CreateDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
      t.string :dep_name
      t.belongs_to :user, null: true

      t.timestamps
    end
  end
end
