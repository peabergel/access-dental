class Brand < ApplicationRecord
  has_many :products
  has_many :categories, -> { distinct }, through: :products
  acts_as_list top_of_list: 1

  validates :name, :image_url, :website_url, :primary_color, :secondary_color, presence: true

  scope :ordered, -> { order(position: :asc) }
  scope :sorted_by_name, -> { order(name: :asc) }

  def products_by_category(category)
    products.where(category: category)
  end
end
