# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_voter
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :folders
  has_many :photos, through: :folders
  has_many :comments, dependent: :destroy
end