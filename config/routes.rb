Rails.application.routes.draw do

  root 'static_page#home'
  get 'images', action: :index, controller: 'categories/photos'
  get 'comments', action: :index, controller: 'categories/photos/comments'
  post 'categories/:id/edit', action: :edit, controller: 'categories'
  post 'categories/:category_id/photos/:id/edit', action: :edit, controller: 'categories/photos'
  post 'categories/:category_id/photos/:photo_id/comments/:id/edit', action: :edit, controller: 'categories/photos/comments'

  #patch '/categories/:id/subscribe', action: :subscribe, controller: 'categories'
  #delete '/categories/:id/unsubscribe', action: :unsubscribe, controller: 'categories'
  #patch 'upvote/category/photo', action: :upvote, controller: 'categories/photos'
  devise_for :users
 

  resources :categories do 
      member do  
        patch :subscribe
        delete :unsubscribe
      end
    resources :photos, module: :categories do
        member do  
          patch :upvote
        end
      resources :comments, module: :photos

    end
  end
end
