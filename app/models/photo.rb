class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :folder
  has_many :comments, dependent: :destroy
end
