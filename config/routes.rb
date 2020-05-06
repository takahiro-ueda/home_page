Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  
  resources :posts do
    resources :likes, only: [:create, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
  end
  
  resources :users, only: [:index, :show, :create, :edit, :update]
  
  
end
