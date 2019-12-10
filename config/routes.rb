Rails.application.routes.draw do
  root "events#index"

  post '/users/new', to: "users#create"
  post 'sessions/new', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  post '/events/new', to: "events#create"
  post '/invitations/new', to: "invitations#create"
  get '/users/:id/invitations', to: "invitations#index", as: 'invitations'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :events, only: [:new, :create, :show, :index]
  resources :invitations, only: [:new, :create, :destroy]
  resources :attendings, only: [:create, :destroy]
end
