Rails.application.routes.draw do
  devise_for :users
  root to:"users#index"
  resources :users, only: [:edit, :update, :show] do
    resource :relationships, only: [:create, :destroy]
    resource :rooms, only: [:new, :create]
  end
end
