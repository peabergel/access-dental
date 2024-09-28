class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :position
      t.references :brand, null: false, foreign_key: true
      t.string :description
      t.string :image_url
      t.string :pdf_url

      t.timestamps
    end
  end
end
