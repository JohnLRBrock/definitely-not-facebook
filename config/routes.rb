Rails.application.routes.draw do
  devise_scope :user do
    root 'devise/sessions#new'
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
  # For details on the DSLclass Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController available within this file, see http://guides.rubyonrails.org/routing.html
end
