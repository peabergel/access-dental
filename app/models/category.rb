class Category < ApplicationRecord
  belongs_to :parent, class_name: "Category", optional: true
  has_many :children, class_name: "Category", foreign_key: "parent_id"
  has_many :products, dependent: :destroy
  has_many :brands, -> { distinct }, through: :products

  scope :parents, -> { where(parent_id: nil) }
end
