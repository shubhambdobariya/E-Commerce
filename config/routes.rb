require 'sidekiq/web'
require 'resque/server'


Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  mount Resque::Server.new, at: "/resque"
  
  
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get 'user_profile', to: 'users#profile', as: 'user_profile'
  
  root 'products#index'

  resources :projects do
    resources :comments
    resources :tickets, only: [:new, :create, :show, :index]
    member do
      get 'check_tickets'
    end
  end

  resources :products, param: :id do
    resources :comments
  end

  resources :tickets do
    member do
      patch :assign_developer
      delete :destroy
    end
  end

  resources :developers
  resources :categories
  resources :comments
end
