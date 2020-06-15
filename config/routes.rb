Rails.application.routes.draw do
  get 'recipelists/index'
  get 'recipes/index'
  get 'winelists/index'
  devise_for :users
  root "roots#index"
  resources :users, only: [:edit, :update] do
  end

  resources :wines
  resources :recipes

  get '/butler' => 'roots#butler', as: 'butler_root'
  get '/homepage' => 'roots#homepage', as: 'homepage_root'
  namespace :homepage do
    resources :winelists, only: [:index, :show]
    resources :recipelists, only: [:index, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
