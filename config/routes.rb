Rails.application.routes.draw do
  resources :performances, only: [:create, :index]
  resources :sessions, only: [:create, :show, :destroy]
  resources :users, only: [:create, :show, :update, :destroy]
  resources :recordings, only: [:create, :show, :destroy]
  post '/login', to: 'auth#create'
  get '/persist', to: 'auth#show'
end
