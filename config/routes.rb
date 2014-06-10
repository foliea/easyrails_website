EasyRailsWebsite::Application.routes.draw do

  mount Mercury::Engine => '/'

  Mercury::Engine.routes

  ActiveAdmin.routes(self)

  root 'pages#show', defaults: { name: 'home' }

  resources :profiles, only: [:show]

  match 'profile/', to: 'profiles#edit', via: [:get]
  match 'profile/', to: 'profiles#update', via: [:patch, :put]

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  match 'users/add_email/', to: 'users#add_email', as: :add_user_email, via: [:get, :patch]

  resources :pages, param: :name, only: [:show, :update]

  namespace :mercury do
    resources :images, only: [:create, :destroy]
  end

end
