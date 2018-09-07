Rails.application.routes.draw do
  root 'welcome#index'
  resources :deals, only: [:index]
end
