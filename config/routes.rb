Rails.application.routes.draw do
  resources :posts, only: [:create, :show, :destroy]
  resources :users, only: [:create, :show]
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
