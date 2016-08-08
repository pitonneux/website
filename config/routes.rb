# frozen_string_literal: true
Rails.application.routes.draw do
  # require 'sidekiq/web'

  devise_for :users,
             path: 'admin',
             controllers: { registrations: 'registrations' },
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  root 'pages#home'
  get '/home' => 'pages#home'

  resources :locations, only: [:index, :show, :create, :edit, :update, :destroy]
  resources :events
  resources :organizations, only: [:index, :show, :create, :edit, :update, :destroy]
  resources :news_items

  resources :group_messages, only: [:new, :create]
  resources :messages, only: [:index, :create]
  resources :visitors, only: [:index, :create]

  # namespace :admin do
  #   mount Sidekiq::Web => '/sidekiq'
  # end
end
