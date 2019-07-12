class Message < ApplicationRecord
  belongs_to :bird
  belongs_to :user

  mount_uploader :image, ImageUploader
  validates :content, presence: true, unless: :image?
end
