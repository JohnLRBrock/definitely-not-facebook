Rails.application.routes.draw do
  get '/', to: 'posts#index'

  get 'comments/create'

  get 'comments/destroy'

  root 'posts#index'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: :get
  match 'signout', to: 'sessions#destroy', as: 'signout', via: :delete
  post '/friendships/:friend_id', to: 'friendships#create', as: 'new_friendship'
  delete '/friendships/:friend_id', to: 'friendships#destroy', as: 'destroy_friendship'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :users, except: [:new, :create]
  resources :posts, only: [:index, :create]
  resources :comments, only: [:create]
end
