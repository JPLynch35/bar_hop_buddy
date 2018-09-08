Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/google_oauth2/callback', to: 'sessions#create', as: 'callback'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  post '/location', to: 'location#create'

  resources :deals, only: [:index]
  resource :map, only: [:show], controller: 'map'

  namespace :api do
    namespace :v1 do
      
    end
  end

end
