class Subscribe < ApplicationRecord
    belongs_to :user
    belongs_to :category
    validates :category, uniqueness: true
end
