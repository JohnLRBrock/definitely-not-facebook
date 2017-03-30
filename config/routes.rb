Rails.application.routes.draw do
  get 'comments/create'

  get 'comments/destroy'

  root 'posts#index'
  get '/', to: 'posts#index'
  post '/friendships/:friend_id', to: 'friendships#create', as: 'new_friendship'
  delete '/friendships/:friend_id', to: 'friendships#destroy', as: 'destroy_friendship'
  devise_for :users
  resources :users, except: [:new, :create]
  resources :posts, only: [:index, :create]
  resources :comments, only: [:create]
end
