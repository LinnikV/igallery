class Photo < ApplicationRecord
  mount_uploaders :images, ImageUploader
  belongs_to :user
  belongs_to :folder
 
end
