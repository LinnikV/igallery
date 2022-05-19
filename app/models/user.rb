class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :folders 
  has_many :photos, through: :folders
  has_many :comments, dependent: :destroy


  
end
