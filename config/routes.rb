Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users, only: %i[edit update show] do
    resource :relationships, only: %i[create destroy]
  end

  resources :rooms, only: %i[new create] do
    resources :messages, only: %i[new create]
  end
end
