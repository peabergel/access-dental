class AddPositionToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :position, :integer
  end
end
