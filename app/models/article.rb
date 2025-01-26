class Article < ApplicationRecord
  acts_as_list top_of_list: 1

  scope :ordered_by_position, -> { order(position: :asc) }
end
