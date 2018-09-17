Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/google_oauth2/callback', to: 'sessions#create', as: 'callback'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/location', to: 'location#show'
  post '/location', to: 'location#create'

  post '/user_bars', to: 'user_bars#create'
  delete '/user_bars', to: 'user_bars#destroy'

  resources :deals, only: [:index]
  resource :map, only: [:show], controller: 'map'
  resources :bars, only: [:edit, :update]
end
