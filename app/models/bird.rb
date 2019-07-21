class Bird < ApplicationRecord
  has_many :points
  has_many :messages

  scope :order_bird_name, -> { order('name ASC') }
end
