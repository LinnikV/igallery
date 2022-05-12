class Folder < ApplicationRecord
    belongs_to :user
    has_many :photos, dependent: :destroy
    has_many :imgs

end
