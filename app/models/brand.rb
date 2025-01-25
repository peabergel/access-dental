class Brand < ApplicationRecord
  has_many :products
  has_many :categories, -> { distinct }, through: :products

  validates :name, :image_url, :website_url, :primary_color, :secondary_color, presence: true

  scope :ordered, -> { order(position: :asc) }
  scope :sorted_by_name, -> { order(name: :asc) }

  before_save :set_position

  def products_by_category(category)
    products.where(category: category)
  end

  def set_position
    self.position = Brand.count + 1
  end
end
