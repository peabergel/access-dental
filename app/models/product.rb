class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  acts_as_list top_of_list: 0, scope: :brand

  validates :name, :description, :image_url, :pdf_url, presence: true
end
