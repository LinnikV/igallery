# frozen_string_literal: true

class Photo < ApplicationRecord
  acts_as_votable
  
  
  mount_uploader :image, ImageUploader

  belongs_to :user
  belongs_to :folder
  has_many :comments, dependent: :destroy

  validates :image, presence: true



  def upvote!(user)
    if user.voted_up_on? self, vote_scope: 'like'
      unvote_by user, vote_scope: 'like'
    else
      upvote_by user, vote_scope: 'like'
    end
  end
  
end
