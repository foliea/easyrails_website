EasyRailsWebsite::Application.routes.draw do

  mount Mercury::Engine => '/'

  Mercury::Engine.routes

  ActiveAdmin.routes(self)

  root 'pages#show', defaults: { name: 'home' }

  resources :profiles, only: [:show, :edit, :update]

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  match 'users/:id/add_email/', to: 'users#add_email', as: :add_user_email, via: [:get, :patch]

  resources :pages, param: :name, only: [:show, :update]

  namespace :mercury do
    resources :images
  end

end
