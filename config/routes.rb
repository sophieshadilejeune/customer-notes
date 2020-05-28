Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :folders
  resources :customers
  get 'customers/:id/editnotes', to: 'customers#edit_notes', as: 'edit_notes'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
