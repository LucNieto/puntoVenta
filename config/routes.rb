Rails.application.routes.draw do
  resources :products
  resources :companies
  resources :bussines_names
  resources :welcome, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
