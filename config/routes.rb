Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show,:edit,:update] #users/:idのようなURLになる
  resources :items do
    resources :item_imgs, only: [:show]
    resources :reviews, only: [:new,:create,:show]
    collection do
      get 'search'
    end
  end
  root to: "top#index"
end

