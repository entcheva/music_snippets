Rails.application.routes.draw do
  root to: 'dashboards#index', via: :get
  resource :dashboard, only: [:show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :snippets, only: [:new, :create]

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

end
