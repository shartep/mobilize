Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :members, only: [] do
        post :create, on: :collection
      end
      resources :invites, only: [] do
        post :create, on: :collection
      end
    end
  end
end
