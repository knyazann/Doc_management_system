class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.string :name, null: false
      t.datetime :start_date
      t.datetime :end_date
      t.string :execution
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
