class DropAnanas < ActiveRecord::Migration[6.1]
  def change
    drop_table :ananas
  end
end
