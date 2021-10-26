Rails.application.routes.draw do
get 'secrets/index'
get    'signup'  => 'users#new'
get    'login'   => 'sessions#new'
post   'login'   => 'sessions#create'
delete 'logout'  => 'sessions#destroy'
resources :microposts
devise_for :users
root to: 'home#index'
resources :users

resources :home
resources :account_activations, only: [:edit, :destroy]
resources :microposts,           only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
