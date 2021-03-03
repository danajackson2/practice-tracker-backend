Rails.application.routes.draw do
  resources :sessions
  resources :users, only: [:create, :show]
  resources :recordings, only: [:create, :show, :destroy]
  post '/login', to: 'auth#create'
  get '/persist', to: 'auth#show'
  # post '/prac-data', to: 'users#prac_data'
end
