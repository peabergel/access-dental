class Category < ApplicationRecord
  belongs_to :parent, class_name: "Category", optional: true
  has_many :children, class_name: "Category", foreign_key: "parent_id", dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :brands, -> { distinct }, through: :products

  scope :parents, -> { joins(:children).distinct }
  scope :childless, -> { where.not(id: Category.joins(:children).select(:id)) }
  scope :parentless, -> { where(parent_id: nil) }

  def brand_category_products(brand)
    products.where(brand: brand).order(position: :asc)
  end

  def complete_name
    parent.nil? ? name : "#{parent.name} - #{name}"
  end
end
