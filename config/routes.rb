Rails.application.routes.draw do
  get  "top/main"
  post "top/login"
  get  "top/logout"

  root "tweets#index"

  resources :users

  resources :tweets

  resources :likes
end
