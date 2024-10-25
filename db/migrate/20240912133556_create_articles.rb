class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :image_url
      t.string :pre_content
      t.text :content

      t.timestamps
    end
  end
end
