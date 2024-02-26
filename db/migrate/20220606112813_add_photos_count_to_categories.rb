# frozen_string_literal: true

class AddPhotosCountToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :photos_count, :integer, null: false, default: 0
  end
end
