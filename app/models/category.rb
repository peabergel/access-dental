class Category < ApplicationRecord
  belongs_to :parent, class_name: "Category", optional: true
  has_many :children, class_name: "Category", foreign_key: "parent_id"
  has_and_belongs_to_many :brands
  has_many :products, through: :brands, dependent: :destroy

  scope :parents, -> { where(parent_id: nil) }
end
