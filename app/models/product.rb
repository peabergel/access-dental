class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  acts_as_list top_of_list: 1, scope: [ :brand_id, :category_id ]

  validates :name, :description, :image_url, presence: true
end
