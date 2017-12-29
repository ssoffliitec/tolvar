Rails.application.routes.draw do

  root to: 'dashboard#index'
  
  devise_for :users

  resources :items
  resources :units
  resources :towns
  resources :categories
  resources :marcas
  resources :recordatorios
  resources :customers

  resources :sales do
    resources :sale_details
  end
  #get 'validate_suggested_marca/index'
  get '/marcas_suggestion', to: 'marcas_suggestion#index'
  get '/validate_suggested_marca', to: 'validate_suggested_marca#index'


  #get 'validate_suggested_item/index'
  get '/items_suggestion', to: 'items_suggestion#index'
  get '/validate_suggested_item', to: 'validate_suggested_item#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end