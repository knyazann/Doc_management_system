class CreateContractors < ActiveRecord::Migration[6.1]
  def change
    create_table :contractors do |t|
      t.string :contr_name

      t.timestamps
    end
  end
end
