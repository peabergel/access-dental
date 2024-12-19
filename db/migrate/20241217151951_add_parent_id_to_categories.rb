class AddParentIdToCategories < ActiveRecord::Migration[7.2]
  def change
    add_reference :categories, :parent, foreign_key: { to_table: :categories }, null: true
  end
end
