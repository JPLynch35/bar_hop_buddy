Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/google_oauth2/callback', to: 'sessions#create', as: 'callback'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  resources :deals, only: [:index]
end
