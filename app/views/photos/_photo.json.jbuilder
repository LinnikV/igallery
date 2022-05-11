json.extract! photo, :id, :img, :user_id, :folder_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
