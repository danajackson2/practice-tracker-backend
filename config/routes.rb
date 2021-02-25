Rails.application.routes.draw do
  resources :sessions
  resources :users, only: [:create]
  post '/login', to: 'auth#create'
  get '/persist', to: 'auth#show'
end
