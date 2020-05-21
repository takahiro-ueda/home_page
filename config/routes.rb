Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users do
    collection do
      get 'profile', to: 'users#profile'
      get 'overview', to: 'users#overview'
    end
  end
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :categories
    collection do
      get 'search'
    end
  end

end