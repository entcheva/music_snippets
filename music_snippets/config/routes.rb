Rails.application.routes.draw do
  # root to: 'application#index'
  resource :dashboard, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :snippets, only: [:index, :new, :create, :show]
  resources :users, only: [:create, :show]
  get '/users/new', to: "users#new", as: 'signup'
end
