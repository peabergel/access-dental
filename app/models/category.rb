class Category < ApplicationRecord
  has_many :products, through: :brands, dependent: :destroy
end
