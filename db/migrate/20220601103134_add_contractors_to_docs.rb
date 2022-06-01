class AddContractorsToDocs < ActiveRecord::Migration[6.1]
  def change
    add_reference :documents, :contractor
  end
end
