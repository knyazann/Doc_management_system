class AddDocType < ActiveRecord::Migration[6.1]
  def change
    add_column :documents, :doc_type, :string
  end
end
