# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_voter
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
  validates :avatar, presence: true
  validates_integrity_of  :avatar
  validates_processing_of :avatar
  has_one_attached :avatar
  has_many :categories
  has_many :photos, through: :categories
  has_many :comments, dependent: :destroy
  has_many :subscribes, dependent: :destroy
  has_many :events, dependent: :destroy
end
