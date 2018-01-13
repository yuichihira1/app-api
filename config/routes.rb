Rails.application.routes.draw do
  devise_for :users, only: []
  root to: 'users#index'

  resource :login, only: [:create], controller: :sessions
  resource :cookie, only: [:show], controller: :sessions
  resource :show, only: [:show], controller: :users
  resource :show, only: [:show], controller: :users
  resource :scorepost, only: [:create], controller: :scores
  resource :scoreget, only: [:show], controller: :scores


  resources :users, only: [:index, :create, :show] do
    resources :scores, only: [:create, :show]
  end


end
