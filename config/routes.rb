Rails.application.routes.draw do
  devise_for :users, path: 'admin', controllers: {registrations: 'registrations'}, path_names: { sign_in: 'login',
                                                                                                 sign_out: 'logout',
                                                                                                 sign_up: 'register' }

  root 'pages#home'

  resources :locations
  resources :events
  resources :organizations
  resource  :messages, only: :create

  get '/home' => 'pages#home'
end
