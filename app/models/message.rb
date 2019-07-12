class Message < ApplicationRecord
  belongs_to :bird
  belongs_to :user

  validates :content, presence: true, unless: :image?
end
