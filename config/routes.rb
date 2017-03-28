Rails.application.routes.draw do
  root 'users#index'
  get '/', to: 'posts#index'
  devise_for :users
  resources :users, except: [:new, :create]
  resources :posts, only: [:index]
end
