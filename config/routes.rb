Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'groups#index'
  
  resources :groups
  resources :restaurants, except: [:show]
  resources :votes

  get '/users', to: 'users#index', as: 'users'
  post '/users', to: 'users#create'
  get 'users/:google_id', to: 'users#show', as: 'user'
  patch 'users/:google_id', to: 'users#update'
  get '/groups/:group_name/members', to: 'groups#show_users'
  post '/restaurants', to: 'restaurants#create'
  get '/groups/:group_name/restaurants', to: 'groups#show_restaurants'
  get '/groups/:group_name/votes', to: 'groups#show_votes'
  get '/groups/:group_name/winner', to: 'groups#get_winner'
  get '/groups/:group_name/total_votes', to: 'groups#get_votes_by_restaurant'
  get '/restaurants/restaurant_details', to: 'restaurants#restaurant_details'
  post '/details', to: 'details#create'
  get 'details/:yelp_id', to: 'details#show'

end
