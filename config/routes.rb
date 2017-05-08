Rails.application.routes.draw do
  root to: 'dashboards#index', via: :get
  resource :dashboard, only: [:show]
  resources :snippets, only: [:new, :create]
  resources :users, only: [:create]
end
