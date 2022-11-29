Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :favorites, only: :index
  resources :products do
    resources :favorites, only: [:new, :create, :destroy]
  end
  resources :users
end
