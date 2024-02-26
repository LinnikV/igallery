# frozen_string_literal: true

class AddCommentsCountToPhotos < ActiveRecord::Migration[7.0]
  def change
    add_column :photos, :comments_count, :integer, null: false, default: 0
  end
end
