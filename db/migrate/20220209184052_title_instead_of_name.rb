class TitleInsteadOfName < ActiveRecord::Migration[6.1]
  def change
    rename_column :goals, :name, :title
  end
end
