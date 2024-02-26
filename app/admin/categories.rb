# frozen_string_literal: true

ActiveAdmin.register Category do
  index do
    selectable_column
    column :id
    column :title
    column :slug
    column :user
    column :photos_count
    column :created_at
    column :updated_at
    actions
  end

  filter :user
  filter :photos
  filter :created_at
  filter :updated_at
  filter :slug

  form do |f|
    f.inputs do
      f.input :user
      f.input :title

      f.input :slug
    end
    f.actions
  end

  permit_params do
    params = %i[user_id title]
    params.push :user_id, :title
    params
  end
end
