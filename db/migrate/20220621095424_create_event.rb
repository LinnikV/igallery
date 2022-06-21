class CreateEvent < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :url

      t.timestamps
    end
  end
end
