class Product < ApplicationRecord
  belongs_to :brand
  has_one :category, through: :brand
end
