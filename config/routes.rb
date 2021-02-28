Rails.application.routes.draw do
  resources :sessions
  resources :users, only: [:create]
  post '/recordings', to: 'recordings#create'
  post '/login', to: 'auth#create'
  get '/persist', to: 'auth#show'
  post '/instEtudes', to: 'etudes#instEtudes'
end
