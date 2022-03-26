class AddToDocuments < ActiveRecord::Migration[6.1]
  def change
    add_column :documents, :number, :integer
    add_reference :documents, :user, foreign_key: true
    add_column :documents, :status, :string
  end
end
