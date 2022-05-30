Rails.application.routes.draw do

  root 'static_page#home'
  get 'images', action: :index, controller: 'categories/photos'
  get 'comments', action: :index, controller: 'categories/photos/comments'
  
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
      resources :comments, module: :photos do

      end
    end
  end
end
