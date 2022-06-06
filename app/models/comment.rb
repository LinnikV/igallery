class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :photo, counter_cache: true

  validates :body, presence: true
  validates :body, uniqueness: { scope: :photo_id }
  validates :body, length: { in: 2..1000 }
end
