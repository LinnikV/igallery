class CreateSubscribes < ActiveRecord::Migration[7.0]
  def change
    create_table :subscribes do |t|
      t.string :user_id
      t.string :category_id, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
