class Category < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :subscribes, dependent: :destroy

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, length: { in: 3..50 }
end
