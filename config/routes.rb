Rails.application.routes.draw do
  devise_for :users
  root 'birds#index'
  resources :points, only: [:create]
  resources :birds, only: [:index, :show]
end