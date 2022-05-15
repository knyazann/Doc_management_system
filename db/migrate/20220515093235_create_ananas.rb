class CreateAnanas < ActiveRecord::Migration[6.1]
  def change
    create_table :ananas do |t|
      t.string :testing

      t.timestamps
    end
  end
end
