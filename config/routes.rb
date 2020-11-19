Rails.application.routes.draw do
  devise_for :users 
  root to: 'pages#home'

  resources :services do
    resources :bookings, only: [:create]
    resources :reviews, only: [:create]
  end
  resources :bookings, only: [:index, :show, :edit, :update]
  resources :reviews, only: [:edit, :update, :destroy]

  patch "/bookings/:id/cancel", to: "bookings#cancel", as: :cancel_booking
  patch "/bookings/:id/accept", to: "bookings#accept", as: :accept_booking

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
