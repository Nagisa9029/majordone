Rails.application.routes.draw do
  devise_for :users
  root "roots#index"
  resources :users, only: [:edit, :update]
  resources :wines
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
