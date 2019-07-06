Rails.application.routes.draw do
  root 'birds#index'
  resources :birds, only: [:index]
end