Rails.application.routes.draw do
  get 'reservations/index'
  get 'reservations/comfirm'
  get 'reservations/new'
  get 'reservations/show'
  get 'reservations/edit'
  devise_for :users
  get 'products/own'
  get 'tops/home'

  resources :products do
    resources :reservations, only: [:create, :index, :new, :confirm, :show, :edit, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "tops#home"
end
