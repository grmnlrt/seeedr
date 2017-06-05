Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  get '/companies/dashboard/payment/:id', to: 'dashboard#dashboard_payment', as: "payment"
  resources :artworks, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:edit, :update, :destroy] do
    collection do
      get 'artist/:id', to: "users#show_artist", as: 'artist'
      get 'company/:id', to: "users#show_company", as: 'company'
      get 'dashboard/artist', to: 'dashboard#dashboard_artist'
      get 'dashboard/company', to: 'dashboard#dashboard_company'
    end
  end
  resources :exhibitions do
    collection do
      get 'new/step1', to: "exhibitions#new_step_one"
      get 'new/step2', to: "exhibitions#new_step_two"
    end
  end
  post 'exhibition-price', to: "exhibitions#estimate_price"
  resources :bids, only: [:show, :new, :create, :edit, :update, :destroy]

  mount Attachinary::Engine => "/attachinary"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
