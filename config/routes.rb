Rails.application.routes.draw do
  get 'contact', to: 'pages#contact'

  get 'products/filter', to: 'products#filter'

  resources 'products', only: [:index, :show]

  root to: 'pages#about'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
