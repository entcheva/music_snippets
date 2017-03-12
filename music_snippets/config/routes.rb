Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :show]
  resources :snippets, only: [:index, :new, :create, :show]
  resource :dashboard, only: [:index]
end
