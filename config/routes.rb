Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :companies
  resources :bussines_names
  resources :sales do
    collection do
      get ':id/charge' => :sale_charge, as: 'charge' # /sales/charge
    end
  end
  resources :welcome, only: [:index]
  root to: "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
