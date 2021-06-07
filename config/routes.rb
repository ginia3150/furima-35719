Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products do
    resources :purchase_historys, only: [:create, :index]
  end
end
