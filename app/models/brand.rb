class Brand < ApplicationRecord
  has_many :products
  has_many :categories, -> { distinct }, through: :products
  acts_as_list top_of_list: 0

  validates :name, :image_url, :website_url, :primary_color, :secondary_color, presence: true

  scope :ordered, -> { order(position: :asc) }
  scope :sorted_by_name, -> { order(name: :asc) }

  # before_create :set_position

  def products_by_category(category)
    products.where(category: category)
  end

  # def set_position
  #   self.position = Brand.count + 1
  # end
end
