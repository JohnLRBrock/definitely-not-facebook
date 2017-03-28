Rails.application.routes.draw do
  root 'users#index'
  get '/', to: 'posts#index'
  post 'new_friend/:friend_id' => 'users#new_friend', as: :new_friend
  devise_for :users
  resources :users, except: [:new, :create]
  resources :posts, only: [:index]
end
