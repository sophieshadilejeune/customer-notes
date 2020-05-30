Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :folders
  resources :customers do
    resources :customer_products
  end
  get 'customers/:id/editnotes', to: 'customers#edit_notes', as: 'edit_notes'
  get 'customers/:id/editproducts', to: 'customers#edit_products', as: 'edit_products'
  get 'map', to: 'pages#map', as: 'map'
  resources :products, except: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
