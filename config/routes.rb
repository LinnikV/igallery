Rails.application.routes.draw do
  
  root 'static_page#home'
  devise_for :users
  get 'images', action: :index, controller: 'folders/photos'
  get 'comments', action: :index, controller: 'folders/photos/comments'

  resources :folders do
    resources :photos, module: :folders do
      resources :comments, module: :photos
    end
  end

 
  
end
