Rails.application.routes.draw do
  root to: 'pages#about'

  # Page Routes
  get 'contact', to: 'pages#contact'
  get 'products/filter', to: 'products#filter'

  # Cart Routes
  get 'cart', to: 'cart#index'
  post 'add-to-cart', to: 'cart#add_to_cart'
  post 'update-quantity', to: 'cart#update_quantity'

  # Product Routes
  resources 'products', only: [:index, :show]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
