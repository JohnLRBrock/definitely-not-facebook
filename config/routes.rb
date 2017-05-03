Rails.application.routes.draw do
  root 'posts#index'
  get '/', to: 'posts#index'
  get 'comments/create'
  get 'comments/destroy'

  match  'auth/:provider/callback',     to: 'sessions#create',                        via: [:get, :post]
  match  'auth/failure',                to: redirect('/'),                            via: :get
  match  'signout',                     to: 'sessions#destroy',        as: 'signout', via: :delete

  post   '/friendships/:friend_id',     to: 'friendships#create',      as: 'new_friendship'
  delete '/friendships/:friend_id',     to: 'friendships#destroy',     as: 'destroy_friendship'
  post   '/friend_requests/:friend_id', to: 'friend_requests#create',  as: 'new_friend_request'
  delete '/friend_requests/:friend_id', to: 'friend_requests#destroy', as: 'destroy_friend_request'
  get    '/friend_requests',            to: 'friend_requests#index',   as: 'friend_requests'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, except: [:new, :create]
  resources :posts, only: [:index, :create]
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
end
