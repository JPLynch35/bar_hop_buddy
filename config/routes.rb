Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/google_oauth2/callback', to: 'sessions#create', as: 'callback'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  post '/location', to: 'location#create'
  get '/location', to: 'location#show'
  post '/user_bars', to: 'user_bar#create'

  resources :deals, only: [:index]
  resource :map, only: [:show], controller: 'map'
end
