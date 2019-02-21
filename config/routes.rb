Rails.application.routes.draw do
  root   'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :hacks
  resources :comments
  resources :hacks, only: [:new, :create, :destroy] do 
    resources :codes, only: [:show, :new, :create, :edit, :update, :destroy]
  end
  
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :relationships,       only: [:create, :destroy]
end
