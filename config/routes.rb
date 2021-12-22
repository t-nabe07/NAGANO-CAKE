Rails.application.routes.draw do
  get 'customers/edit'
  get 'customers/show'
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
  get 'cart_items/all_destroy' => 'cart_items#all_destroy'

  resource :customers, only: [:show, :edit, :update]
  patch 'customers/withdraw' => 'customers#withdraw'
  get 'customers/unsubscribe' => 'customers#unsubscribe'

  post 'orders/confirm' => 'orders#confirm'
  get 'orders/thanx' => 'orders#thanx'
  resources :orders, only: [:index, :show, :new, :create]


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
