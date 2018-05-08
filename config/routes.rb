Rails.application.routes.draw do
  namespace :reports do
    get 'sales/index'
  end

  namespace :reports do
    get 'sales/new'
  end

  devise_for :users
  resources :products
  resources :companies
  resources :bussines_names
  resources :welcome, only: [:index]
  root to: "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :reports do 
    resources :sales, only: [:index, :new, :create]
    resources :products, only: [:index, :new, :create]
  end
end
