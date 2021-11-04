Rails.application.routes.draw do
resources :microposts do
  resources :comments
end
get 'secrets/index'
devise_for :users
root to: 'home#index'
resources :users do
    member do
      get :following, :followers
    end
  end
resources :home
resources :relationships, only: [:create, :destroy]
end
