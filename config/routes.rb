Rails.application.routes.draw do
  get 'sessions/new'

  resources :sessions
  resources :users, only: [:new, :create]
  resources :profiles, only: [:index, :update]
  resources :posts, only: [:create, :index, :update]

  root :to => "sessions#new"
  get "log_in" => "sessions#new", :as => "log_in"
  get 'index' => 'pages#index', :as => 'index'
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"


  # get 'landing_page' => 'pages#index', :as => 'landing_page'
  # get 'profiles' => 'profiles#index'
  # patch 'profiles/:id' => 'profiles#update'
  # get 'posts' => 'posts#index'
  # post 'posts' => 'posts#create'
  # patch 'posts/:id' => 'posts#update'


end
