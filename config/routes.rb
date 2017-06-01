Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :artworks, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:edit, :update, :destroy] do
    collection do
      get 'artist/:id', to: "users#show_artist"
      get 'company/:id', to: "users#show_company"
      get 'dashboard/artist', to: 'dashboard#dashboard_artist'
      get 'dashboard/company', to: 'dashboard#dashboard_company'
    end
  end
  resources :exhibitions
  resources :bids, only: [:show, :new, :create, :edit, :update]

  mount Attachinary::Engine => "/attachinary"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
