Rails.application.routes.draw do
  unauthenticated do
    root to: 'home#index', as: :unauthenticated_root
  end

  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end

  devise_for :users

 
  resources :categories, only: [:index, :show, :create, :new] do
    resources :deals, :only=> [:new, :create, :index, :show]
    end
end
