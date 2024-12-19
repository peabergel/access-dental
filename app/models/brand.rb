class Brand < ApplicationRecord
  has_many :products
  has_many :categories, -> { distinct }, through: :products

  def products_by_category(category)
    products.where(category: category)
  end

  # validates :name, :position, :image_url, :website_url, :primary_color, :secondary_color, presence: true
end
