Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  get "home", to: "home#index"
  resources :books, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  # ~ get "books/:id", to: "books#show"
  # [...]
  # get "/books/:id/edit", to: "books#edit"
  # patch "/books/:id", to: "books#update"
  # delete "/books/:id", to: "books#desstroy"
end
