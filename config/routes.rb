Rails.application.routes.draw do
  root "users#new"

  post '/users/new', to: "users#create"
  post 'sessions/new', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  post '/events/new', to: "events#create"
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :events, only: [:new, :create, :show, :index]
end
