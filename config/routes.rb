Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show,:edit,:update] #users/:idのようなURLになる
  resources :items do
    resources :reviews, only: [:new,:create]
    collection do
      get 'search'
    end
  end
  root to: "top#index"
end

