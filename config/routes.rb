Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users do
    collection do
      get 'profile', to: 'users#profile'
      get 'career', to: 'users#career'
      get 'overview', to: 'users#overview'
      get 'problem', to: 'users#problem'
    end
  end
  resources :posts do
    resources :categories
    collection do
      get 'search'
    end
  end
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

end