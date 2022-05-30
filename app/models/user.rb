class User < ApplicationRecord
  acts_as_voter
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :categories
  has_many :photos, through: :categories
  has_many :comments, dependent: :destroy
  has_many :subscribes, dependent: :destroy
end
