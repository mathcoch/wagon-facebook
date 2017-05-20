Rails.application.routes.draw do
  devise_for :users
  root :to => "pages#index"

  resources :profiles, only: [:update]
  resources :posts, only: [:create, :update]
end
