Rails.application.routes.draw do
  devise_for :users
  root to:"users#index"
  resources :users, only: [:edit, :update, :show] do
    resource :relationships, only: [:create, :destroy]
  end

  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:new,:create] 
   end

end
