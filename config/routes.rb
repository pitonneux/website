# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users,
             path: 'admin',
             controllers: { registrations: 'registrations' },
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  root 'pages#home'

  resources :locations, only: [:index, :show, :create, :edit, :update, :destroy]
  resources :events, only: [:index, :show, :create, :edit, :update, :destroy]
  resources :organizations, only: [:index, :show, :create, :edit, :update, :destroy]
  resources :projects, only: [:index, :show, :create, :edit, :update, :destroy]
  resource  :messages, only: :create

  get '/home' => 'pages#home'
end
