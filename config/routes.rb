Rails.application.routes.draw do
  get 'products/index'
  get 'products/new'
  devise_for :users
  root to: "products#index"
  resources :products, only: [:new, :create, :index]
end
