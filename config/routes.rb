Rails.application.routes.draw do


  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items
    resources :genres, only: [:create, :index, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    get 'homes/top'
  end

  namespace :public do
    get 'homes/top'
    get 'homes/about'
    resources :customers, only: [:show, :edit, :update]
    get 'customers/unsubscribe'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:create, :index, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    get 'orders/complete'
    resources :deliveries, only: [:create, :index, :edit, :update]
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
