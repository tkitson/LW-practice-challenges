Rails.application.routes.draw do
  root to: "museums#index"
  get '/search', to: "museums#search"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
