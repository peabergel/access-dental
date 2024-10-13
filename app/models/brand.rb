class Brand < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :category

  validates :name, :category_id, :position, :image_url, :website_url, :primary_color, :secondary_color, :tertiary_color, presence: true
end
