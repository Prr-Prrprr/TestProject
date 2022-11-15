Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'home#index'

  resources :categories, only: [:index, :show]
  resources :users, only: [:show]
  resources :appointments, only: [:index, :new, :create]
  
  get 'doctors', to: 'doctors#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
