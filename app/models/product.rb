class Product < ApplicationRecord
  belongs_to :brand
  has_one :category, through: :brand

  # validates :name, :brand_id, :description, :image_url, :pdf_url, :position, presence: true
end
