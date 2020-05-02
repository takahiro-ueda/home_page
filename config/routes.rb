Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  
  resources :posts
  # resources :users, only: :show
  resources :users, only: [:index, :show, :create, :edit, :update]                                                             
end
