Rails.application.routes.draw do
  root to: 'dashboards#index', via: :get
  resource :dashboard, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :snippets, only: [:index, :new, :create, :show]
  # resources :users, only: [:create, :show]
  # get '/users/new', to: "users#new", as: 'signup'
end
