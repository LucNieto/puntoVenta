Rails.application.routes.draw do
  devise_for :users

  resources :products do
    collection do
      post :import
    end
  end

  resources :companies do
    collection do
      post :import
    end
  end

  resources :bussines_names do
    collection do
      post :import
    end
  end
  
  resources :sales do
    resources :charges, only: [:new, :show]
    post 'charges/charge'
    # collection do
    #   get ':id/charge' => :sale_charge, as: 'charge' # /sales/charge
    # end
  end
  namespace :reports do 
    resources :sales, only: [:index, :new, :create]
    get 'sales/reporting'
    resources :products, only: [:index, :new, :create]
    get 'products/reporting'
  end
  resources :welcome, only: [:index]
  root to: "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
