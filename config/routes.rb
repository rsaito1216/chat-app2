Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create, :destroy, :edit, :update] do
    resources :messages, only: [:index, :create, :destroy]
  end
end
