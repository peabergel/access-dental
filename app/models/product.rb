class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  # validates :name, :brand_id, :description, :image_url, :pdf_url, :position, presence: true
end
