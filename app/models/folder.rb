# frozen_string_literal: true

class Folder < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, length: { in: 3..50 }
end
