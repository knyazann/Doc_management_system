class AddAlternativeToSteps < ActiveRecord::Migration[6.1]
  def change
    add_column :steps, :condition1, :string
    add_column :steps, :condition2, :string
    add_reference :steps, :next1, foreign_key: { to_table: :steps }
    add_reference :steps, :next2, foreign_key: { to_table: :steps }    
  end
end