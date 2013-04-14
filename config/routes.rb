StoreEngine::Application.routes.draw do

  # resources :store
  resources :users

  resources :static_pages, :only => :index

  resources :categories, :only => [:index, :show]

  put '/add_quantity_to_cart/:id' => 'carts#add_quantity_to_cart', :as => 'add_quantity_to_cart'
  put '/decrease_quantity_from_cart/:id' => 'carts#decrease_quantity_from_cart', :as => 'decrease_quantity_from_cart'

  

  resources :billing_address
  resources :shipping_addresses
  resources :line_items
  resources :stores
  resources :sessions

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'register', to: 'stores#new', as: 'register'

  get 'profile', :to => 'users#show', as: 'profile'

  resources :phone_numbers

  scope "/:store_id" do
    match "/" => "products#index", :as => :home

    resources :products
    resources :carts
    resources :orders
    resources :guest_orders

    namespace :admin do
      resource :dashboard, :only => :show
      resources :products, :except => :destroy
      resources :orders#, :only => [:index, :show, :update]
      resources :categories
      resources :users #, :except => [:index, :destroy]


      match "/" => "dashboards#show"
      put '/add_quantity_to_order/:id' => 'orders#add_quantity_to_order', :as => 'add_quantity_to_order'
      put '/decrease_quantity_from_order/:id' => 'orders#decrease_quantity_from_order', :as => 'decrease_quantity_from_order'
    end

  end






  root :to => 'static_pages#index'

end