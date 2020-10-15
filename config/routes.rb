Rails.application.routes.draw do
  root to: "posts#index" 
  resources :posts, only: [:create, :destroy]
  resources :users, only: [:create, :show]
  post "/posts/:id", to: "posts#destroy"
  post "/users/:id", to: "posts#create"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
  get "/rails/active_storage/blobs/:signed_id/*filename(.:format)", to: "active_storage/blobs#show"
  get "/rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)", to: "active_storage/representations#show"
  get "/rails/active_storage/disk/:encoded_key/*filename(.:format)", to: "active_storage/disk#show"
  put "/rails/active_storage/disk/:encoded_token(.:format)", to: "active_storage/disk#update"
  post "/rails/active_storage/direct_uploads(.:format)", to: "active_storage/direct_uploads#create"
  # the attempts below block ActiveStorage access to images; still working on a fix.
  match "*path", to: "application#catch_404", via: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
