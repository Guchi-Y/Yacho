class Bird < ApplicationRecord
  has_many :points
  has_many :messages
end
