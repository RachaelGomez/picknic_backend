Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'groups#index'
  
  resources :groups
  resources :restaurants

  get '/users', to: 'users#index', as: 'users'
  post '/users', to: 'users#create'
  get 'users/:google_id', to: 'users#show', as: 'user'
  patch 'users/:google_id', to: 'users#update'
  get '/groups/:group_name/members', to: 'groups#show_users'

end
