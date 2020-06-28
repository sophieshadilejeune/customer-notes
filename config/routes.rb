Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :folders
  resources :customers do
    resources :customer_products
    resources :contacts
  end
  get 'customers/:id/editnotes', to: 'customers#edit_notes', as: 'edit_notes'
  get 'customers/:id/editproducts', to: 'customers#edit_products', as: 'edit_products'
  get 'customers/:id/addcontact', to: 'customers#add_contact', as: 'add_contact'
  get 'customers/:customer_id/contacts/:id/editcontact', to: 'customers#edit_contact', as: 'edit_contact'

  get 'map', to: 'pages#map', as: 'map'
  get 'search', to: 'pages#search', as: 'search'
  get 'documents', to: 'pages#documents', as: 'documents'


  resources :products, except: [:show]
  resources :notes do
    collection do
      patch :sort
    end
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
