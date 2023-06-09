Rails.application.routes.draw do

  devise_for :users

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end
  
  unauthenticated do
    devise_scope :user do
      root 'home#index', as: :unauthenticated_root
    end
  end

 
  resources :categories, only: [:index, :show, :create, :new] do
    resources :deals, :only=> [:new, :create, :index, :show]
    end
end
