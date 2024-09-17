class CreateBrands < ActiveRecord::Migration[7.2]
  def change
    create_table :brands do |t|
      t.string :name
      t.integer :position
      t.string :image_url
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
