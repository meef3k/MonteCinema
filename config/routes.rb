Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :movies
  resources :seances
  resources :halls
  # Defines the root path route ("/")
  root 'seances#index'
end
