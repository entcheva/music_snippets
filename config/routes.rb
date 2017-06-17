Rails.application.routes.draw do
  root to: 'dashboards#index', via: :get
  resource :dashboard, only: [:show]
  resources :audio_files, only: [:new, :create, :edit, :update]
  resources :snippets, only: [:new, :create, :edit, :update, :destroy]
  resources :users, only: [:create]
  resources :wishlists, only: [:new, :create, :edit, :update]
end
