class ChangeNumOfDocs < ActiveRecord::Migration[6.1]
  def change
    change_column :documents, :number, :string
  end
end
