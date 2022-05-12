class Photo < ApplicationRecord
  mount_uploaders :imgs, ImgsUploader
  serialize :imgs
  belongs_to :user
  belongs_to :folder
  has_many :imgs
end
