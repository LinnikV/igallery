ActiveAdmin.register Photo do

  index do
    selectable_column
    column :id
    column :image do |img|
      image_tag(img.image.url, height: 50)
    end
    column :category
    column :user
    column :comments_count
    column :cached_votes_total
    column :created_at
    column :updated_at
    actions
  end


  permit_params do
    params = [:image, :category_id, :user_id, :cached_votes_total]
    params.push :image, :category_id, :user_id, :cached_votes_total
    params
  end

  filter :category
  filter :user
  filter :created_at
 

  form do |f|
    f.inputs do
      f.input :image
      f.input :category
      f.input :user
      f.input :cached_votes_total
    end
    f.actions
  end
end
