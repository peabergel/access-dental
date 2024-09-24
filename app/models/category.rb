class Category < ApplicationRecord
  has_many :brands
  has_many :products, through: :brands, dependent: :destroy
end
