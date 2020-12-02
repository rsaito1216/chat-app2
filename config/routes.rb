Rails.application.routes.draw do
  get 'reads/create'
  get 'reads/destroy'
  get 'reads/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create, :destroy, :edit, :update] do
    resources :messages, only: [:index, :create, :destroy, :edit, :update]
  end

  resources :messages, only: [:index, :create, :destroy, :edit, :update] do
    resource :reads, only: [:create, :destroy, :show]
  end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
