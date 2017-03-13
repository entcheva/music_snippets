Rails.application.routes.draw do
  root to: 'dashboards#index', via: :get
  resource :dashboard, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :snippets, only: [:index, :new, :create, :show]
  resources :users, only: [:create, :show]
  get '/users/new', to: "users#new", as: 'signup'
end
