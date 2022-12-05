Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :favorites, only: [:index, :show]
  resources :products do
    resources :chatrooms, only: [:create]
    resources :favorites, only: [:new, :create, :destroy]
  end
  resources :chatrooms, only: [:show, :index] do
    resources :messages
  end

  resources :users, only: [:show]
end
