Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :favorites, only: [:index, :destroy]
  resources :products do
    resources :chatrooms, only: [:create]
    resources :favorites, only: [:create]
  end
  resources :chatrooms, only: [:show] do
    resources :messages
  end

  resources :users, only: [:show]
end
