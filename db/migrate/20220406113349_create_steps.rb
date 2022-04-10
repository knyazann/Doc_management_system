class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.string :type
      t.string :status
      t.belongs_to :route, null: false, foreign_key: true

      t.timestamps
    end
  end
end
