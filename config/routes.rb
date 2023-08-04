Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy' 
    get '/users/random', to: 'users#random' 

  end
  resources :users, only: %i[edit update show] do
    resource :relationships, only: %i[create destroy]
  end

  resources :rooms, only: %i[new create] do
    resources :messages, only: %i[new create]
  end

end
