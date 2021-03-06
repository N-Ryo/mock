Rails.application.routes.draw do

  
  post 'roles/create', to: 'roles#create'

  root   'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  get '/search', to: "searchs#index"

  resources :users do
    # member do
    #   get :following, :followers
    # end
  end
  patch '/hacks/:id', to: 'hacks#update'
  resources :hacks, only: [:index, :show, :new, :create, :destroy] do 
    resources :comments, only: [:new, :show, :create, :edit, :update, :destroy] do
      resources :discussions, only: [:create, :update, :destroy]
    end
  end
  
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :user_relationships,       only: [:create, :destroy]
  resources :user_category_relationships, only: [:create, :destroy]
  resources :reactions,       only: [:create, :update]
end
