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

  # EXPLICITY DEFINING BUILT IN ACTIVE STORAGE ROUTES TO ALLOW FOR A CATCHALL 404 PAGE WHILE NOT BREAKING ACTIVE STORAGE GET REQUESTS.

  # UNSURE IF THIS IS GOOD PRACTICE OR NOT; COMMENT ALL BELOW TO ALLOW FOR NORMAL RAILS EXCEPTIONS AND DEFAULT ROUTING BEHAVIOR.

  get "/rails/active_storage/blobs/:signed_id/*filename(.:format)", to: "active_storage/blobs#show"
  get "/rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)", to: "active_storage/representations#show"
  get "/rails/active_storage/disk/:encoded_key/*filename(.:format)", to: "active_storage/disk#show"
  put "/rails/active_storage/disk/:encoded_token(.:format)", to: "active_storage/disk#update"
  post "/rails/active_storage/direct_uploads(.:format)", to: "active_storage/direct_uploads#create"

  match "*path", to: "application#catch_404", via: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
