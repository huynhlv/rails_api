require 'api_constraints'

SherpaApi::Application.routes.draw do
  devise_for :users, only: []
  # Api definition
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1,
              constraints: ApiConstraints.new(version: 1, default: true) do
      # We are going to list our resources here
      resources :users, only: %i(show create update destroy)
      resources :sessions, only: %i(create destroy)
    end
  end
end
