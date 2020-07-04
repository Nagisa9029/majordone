Rails.application.routes.draw do
  get 'recipelists/index'
  get 'recipes/index'
  get 'winelists/index'
  devise_for :users
  root "roots#index"
  resources :users, only: [:edit, :update] do
  end

  get '/about' => 'roots#about', as: 'about_root'
  get '/butler' => 'roots#butler', as: 'butler_root'
  get '/homepage' => 'roots#homepage', as: 'homepage_root'
  namespace :homepages do
    resources :winelists, only: [:index, :show]
    resources :recipelists, only: [:index, :show]
  end

  resources :wines do
    resources :cart_items, only: [:create]
  end
  
  resources :carts, only: [:create, :show] do
    resources :cart_items, only: [:destroy]
  end
  post '/carts/:id' => 'carts#pay'

  resources :recipes
  resources :domaines, only: [:new, :create]
  resources :sepages, only: [:new, :create]
  resources :roots, only: [:create] do
  end
end
