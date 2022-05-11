Rails.application.routes.draw do
  resources :photos
  resources :folders
  root 'static_page#home'
  devise_for :users
  
end
