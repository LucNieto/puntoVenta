Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :companies
  resources :bussines_names
  resources :welcome, only: [:index]
  resources :sales
  root to: "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
