class RenameRouteName < ActiveRecord::Migration[6.1]
  def change
    rename_column :routes, :name, :route_name
  end
end
