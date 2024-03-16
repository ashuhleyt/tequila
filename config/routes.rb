Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "/"
  get "/bars", to: "bars#index"
  get "/bars/:id", to: "bars#show", constraints: { id: /\d+/ }
  get "/bars/new", to: "bars#new", as: "new_bar"

  get "/drinks", to: "drinks#index"
  get "/drinks/:id", to: "drinks#show"
  get "/bars/:id/drinks", to: "bars_drinks#index"
end
