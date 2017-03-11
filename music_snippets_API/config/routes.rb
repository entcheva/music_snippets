Rails.application.routes.draw do

  namespace 'api' do
    namespace :v1 do
      resources :users, :snippets
      # get '/users', to: 'users#index', as: 'users'
      # get '/users/new', to: 'users#new'
      # get '/users/:id', to: 'users#show'
      # get '/users/:id/edit', to: 'users#edit'
      # patch '/users/:id/edit', to: 'users#edit'

    end
  end

end
