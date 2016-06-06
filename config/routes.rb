Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'

  resources :locations
  resources :events
  resources :organizations

  get '/home' => 'pages#home'

    namespace :admin do
      # Directs /admin/products/* to Admin::ProductsController
      # (app/controllers/admin/products_controller.rb)
      resources :events
      resources :organizations

    end
end
