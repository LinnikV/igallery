class User < ApplicationRecord

  mount_uploader :avatar, AvatarUploader
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  attr_accessible :email, :password, :remember_me, :avatar

  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  has_many :folders 
  has_many :photos, through: :folders

  
end
