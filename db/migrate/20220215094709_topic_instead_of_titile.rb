class TopicInsteadOfTitile < ActiveRecord::Migration[6.1]
  def change
    rename_column :goals, :title, :topic
  end
end
