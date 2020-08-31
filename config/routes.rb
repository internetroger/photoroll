Rails.application.routes.draw do
  root to: "posts#index" 
  resources :posts, only: [:create, :destroy]
  resources :users, only: [:create, :show]
  post "/users/:id", to: "posts#create"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
