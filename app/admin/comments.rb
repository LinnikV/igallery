ActiveAdmin.register Comment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :body, :photo_id, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:body, :photo_id, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  index do
    selectable_column
    column :id
    column :photo
    column :body
    column :user
    column :created_at
    column :updated_at
    actions
  end


  permit_params do
    params = [:body, :user_id, :photo_id]
    params.push :body, :user_id
    params
  end

  filter :body
  filter :user
  filter :photo_id
 

  form do |f|
    f.inputs do
      f.input :body
      f.input :user
    
    end
    f.actions
  end
end
