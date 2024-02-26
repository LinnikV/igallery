# frozen_string_literal: true

ActiveAdmin.register Event do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :url
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :url]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    column :id
    column :user_id
    column :user
    column :url
  end

  filter :user_id
  filter :url
  filter :created_at
end
