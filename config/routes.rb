Rails.application.routes.draw do

  root 'users#index'

  get '/users', to: 'users#index', as: 'users'
  post '/users', to: 'users#create'
  get 'users/:google_id', to: 'users#show', as: 'user'
  patch 'users/:google_id', to: 'users#update'
end
