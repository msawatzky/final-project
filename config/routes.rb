Rails.application.routes.draw do
  root to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'products/filter', to: 'products#filter'
  get 'cart', to: 'products#cart'
  post 'add-to-cart', to: 'products#add_to_cart'

  resources 'products', only: [:index, :show]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
