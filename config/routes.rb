Rails.application.routes.draw do
  devise_for :users
  root 'sessions#new'
  get  'login', to: 'sessions#new'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
