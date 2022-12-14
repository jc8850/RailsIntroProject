Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pokemon#index"
  get "/about" => "application#about"

  get "/pokemon", to: "pokemon#index"
  get "/pokemon/:id", to: "pokemon#show"
  get "/types", to: "types#index"
  get "/types/:id", to: "types#show"

  resources :pokemon do
    get '/page/:page', action: :index, on: :collection
  end
end
