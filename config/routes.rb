Rails.application.routes.draw do
  get 'reservations/index'
  get 'reservations/confirm'
  devise_for :users
  get 'tops/home'
  resources :products
  resources :reservations, only: [:create, :confirm, :index] do
    collection do
      post :confirm
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "tops#home"
end
