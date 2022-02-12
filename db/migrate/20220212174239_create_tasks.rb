class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :number
      t.string :description
      t.datetime :end_date
      t.datetime :completation_date
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :goal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
