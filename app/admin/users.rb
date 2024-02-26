# frozen_string_literal: true

ActiveAdmin.register User do
  index do
    selectable_column
    column :id
    column :email
    column :sign_in_count
    column :current_sign_in_at
    column :last_sign_in_at
    actions
  end

  permit_params do
    params = %i[email password]
    params.push :email, :password
    params
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
    end
    f.actions
  end
end
