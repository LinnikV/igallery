Rails.application.routes.draw do
  root 'static_page#home'
  devise_for :users

  resources :folders do
    resources :photos, only: %i[new create], module: :folders
  end

 
  
end
