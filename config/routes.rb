Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords,], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Customer側のルーティング
  root 'homes#top'
  get 'about' => 'homes#about'
  resources :items, only: [:index, :show]
  
  resources :cart_items, only: [:index, :create, :update, :destroy]
  get 'cart_items/all_destroy' => 'customer/cart_items'
  
  resource :customers, only: [:show, :edit, :update]
  patch 'customers/withdraw' => 'customer/customers#withdraw'
  get 'customers/unsubscribe' => 'customer/customers#unsubscribe'
  
  resources :orders, only: [:index, :show, :new, :create]
  get 'orders/confirm' => 'customer/orders#confirm'
  get 'orders/thanx' => 'customer/orders#thanx'

  resources :addresses, except: [:new, :show]
  

  #admin側のルーティング
  namespace :admin do
    resources :items, except: [:destroy]
    resources :genres, except: [:new, :show, :destroy]
    resources :customers, except: [:new, :create, :destroy]
    resources :orders, only: [:index, :show, :update]
    patch 'orders_details/:id', to: 'order_details#update'
  end
 
end
