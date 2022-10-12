require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  devise_scope :user do
    authenticated :user, ->(u) { u.manager? } do
      mount Sidekiq::Web => '/sidekiq'
    end
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :movies
  resources :seances do
    resources :reservations
    post '/reservations/create_offline', to: 'reservations#create_offline', as: 'offline_reservation'
  end
  resources :halls
  # Defines the root path route ("/")
  root 'seances#index'
end
