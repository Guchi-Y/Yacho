class Point < ApplicationRecord
  belongs_to :bird
  belongs_to :user

  validates :latitude, presence: true
  validates :longitube, presence: true
end
