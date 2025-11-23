class AddPdfUrlToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :pdf_url, :string
  end
end
