class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  validates :name, :description, :image_url, :pdf_url, presence: true

  before_save :set_position

  def set_position
    self.position = brand.products_by_category(category).count + 1
  end
end
