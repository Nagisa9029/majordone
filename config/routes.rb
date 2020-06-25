Rails.application.routes.draw do
  get 'recipelists/index'
  get 'recipes/index'
  get 'winelists/index'
  devise_for :users
  root "roots#index"
  resources :users, only: [:edit, :update] do
  end

  get '/butler' => 'roots#butler', as: 'butler_root'
  get '/homepage' => 'roots#homepage', as: 'homepage_root'
  namespace :homepages do
    resources :winelists, only: [:index, :show]
    resources :recipelists, only: [:index, :show]
  end

  resources :wines do
    resource :cart_items, only: [:create]
  end
  
  resources :carts, only: [:create, :show] do
    resource :cart_items, only: [:destroy]
  end

  resources :recipes
  resources :roots, only: [:create] do
  end
end
