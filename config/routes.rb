Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users do
    collection do
      get 'profile', to: 'users#profile'
    end
  end
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  
end