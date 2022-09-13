Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/seances', controller: 'seances', action: 'index'
  get '/movies/:id', controller: 'movies', action: 'show'
  get '/seances/new', controller: 'seances', action: 'new'
  post '/seances', controller: 'seances', action: 'create'
  # Defines the root path route ("/")
  root "seances#index"
end
