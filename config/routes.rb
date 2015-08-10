Rails.application.routes.draw do
 
  # Users routes
  get "/signup", to: "users#new"
  get "/profile", to: "users#show"

  resources :users, only: [:create]

  # Sesions routes
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  resources :sessions, only: [:create]

  # Posts routes
  resources :posts, except: [:index]

  root "posts#index"


end
