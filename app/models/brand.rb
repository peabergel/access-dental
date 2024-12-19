class Brand < ApplicationRecord
  has_many :products, dependent: :destroy
  has_and_belongs_to_many :categories

  # validates :name, :position, :image_url, :website_url, :primary_color, :secondary_color, presence: true
end
