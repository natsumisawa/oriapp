Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show,:edit,:update] #users/:idのようなURLになる
  root to: "top#index"
end
