require 'resque/server'

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount Resque::Server.new, at: "/resque"

  root 'static_page#home'
  get 'images', action: :index, controller: 'categories/photos'
  get 'comments', action: :index, controller: 'categories/photos/comments'
  post 'categories/:category_id/photos/:photo_id/comments/:id/edit', action: :edit, controller: 'categories/photos/comments'
  post 'categories/:id/edit', action: :edit, controller: 'categories'
  post 'categories/:category_id/photos/:id/edit', action: :edit, controller: 'categories/photos'


  #patch '/categories/:id/subscribe', action: :subscribe, controller: 'categories'
  #delete '/categories/:id/unsubscribe', action: :unsubscribe, controller: 'categories'
  #patch 'upvote/category/photo', action: :upvote, controller: 'categories/photos'
  devise_for :users
 

  resources :categories do 
      member do  
        patch :subscribe
        delete :unsubscribe
      end
    resources :photos,only: %i[show create], module: :categories do
        member do  
          patch :upvote
        end
      resources :comments, only: %i[create], module: :photos

    end
  end
end


