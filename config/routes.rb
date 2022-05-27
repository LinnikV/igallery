Rails.application.routes.draw do
  
  root 'static_page#home'

  get 'images', action: :index, controller: 'folders/photos'
  get 'comments', action: :index, controller: 'folders/photos/comments'
  
  devise_for :users do
    member do
      get :following, :followers
    end
  end
  

  resources :folders do
    resources :photos, module: :folders do
      member do  
        patch :upvote
      end
      
      resources :comments, module: :photos
    end
  end

 
  
end
