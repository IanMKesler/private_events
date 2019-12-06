Rails.application.routes.draw do
  root "users#new"

  post '/users/new', to: "users#create"
  post 'sessions/new', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
