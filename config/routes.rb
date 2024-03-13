Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/bars", to: "bars#index"
  get "/bars/:id", to: "bars#show"

  get "/drinks", to: "drinks#index"
  get "/drinks/:id", to: "drinks#show"
  get "/bars/:id/drinks", to: "bars_drinks#index"
end
