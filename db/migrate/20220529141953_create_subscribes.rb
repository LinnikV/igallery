# frozen_string_literal: true

class CreateSubscribes < ActiveRecord::Migration[7.0]
  def change
    create_table :subscribes do |t|
      t.string :user_id, null: false
      t.string :category_id, null: false

      t.timestamps
    end
  end
end
