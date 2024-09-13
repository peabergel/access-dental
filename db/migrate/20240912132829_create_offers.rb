class CreateOffers < ActiveRecord::Migration[7.2]
  def change
    create_table :offers do |t|
      t.string :name
      t.string :image_url
      t.string :pdf_url
      t.boolean :month_offer

      t.timestamps
    end
  end
end
