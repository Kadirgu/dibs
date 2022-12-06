Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"

  resources :favorites, only: [:index, :destroy]
  resources :products do
    resources :chatrooms, only: [:create]
    resources :favorites, only: [:create]
  end

  resources :chatrooms, only: [:show, :index] do
    member do
      patch :archive
    end
    resources :messages
  end

  resources :users, only: [:show]
end
