Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets, only: [:index, :new, :create, :show] do
    resources :outputs, only: [:new, :create]
  end
end