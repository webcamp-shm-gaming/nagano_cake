Rails.application.routes.draw do


  namespace :admin do
    root to: "homes#top"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items
    resources :genres, only: [:create, :index, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  scope module: :public do
    root to: "homes#top"
    get 'homes/about'
    resource :customers, only: [:show, :edit, :update]
    get 'customers/unsubscribe'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:create, :index, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post :confirm
      end
    end
    get 'orders/complete'
    resources :deliveries, only: [:create, :index, :edit, :destroy, :update]
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
