# frozen_string_literal: true

class Subscribe < ApplicationRecord
  belongs_to :user
  belongs_to :category
end
