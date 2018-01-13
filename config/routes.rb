Rails.application.routes.draw do
  devise_for :users, only: []
  root to: 'users#index'

  resource :login, only: [:create], controller: :sessions
  resource :cookie, only: [:show], controller: :sessions
  resource :show, only: [:show], controller: :users
  resource :show, only: [:show], controller: :users
  resources :users, only: [:index, :create, :show] do

  end


end
