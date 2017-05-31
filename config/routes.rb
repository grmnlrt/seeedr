Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :artworks, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :exhibitions
  resources :bids, only: [:show, :new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
