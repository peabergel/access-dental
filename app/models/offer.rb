class Offer < ApplicationRecord
  acts_as_list top_of_list: 0

  scope :recents, ->(num) { order(position: :desc).limit(num) }
end
