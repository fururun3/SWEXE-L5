Rails.application.routes.draw do
  get "profiles/new"
  get "profiles/create"
  get "profiles/edit"
  get "profiles/update"
  get "profiles/show"
  get  "top/main"
  post "top/login"
  get  "top/logout"

  root "tweets#index"

  resources :users

  resources :tweets

  resources :likes

  resources :profiles
end
