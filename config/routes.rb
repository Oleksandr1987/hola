Rails.application.routes.draw do
  # get    'login'   => 'sessions#new'
  # post   'login'   => 'sessions#create'
  # delete 'logout'  => 'sessions#destroy'
resources :microposts do
  member do
       get "like", to: "microposts#like"
        get "dislike", to: "microposts#dislike"
     end
  resources :comments
end
get 'secrets/index'
devise_for :users
root to: 'home#index'
resources :users do
    get 'profile'
    member do
      get :following
      get :followers
    end
  end
resources :home
resources :relationships, only: [:create, :destroy]
end
