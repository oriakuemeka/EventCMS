Rails.application.routes.draw do
  get 'attendees/index'
  get 'attendees/show'
  get 'events/index'
  get 'events/show'
  get 'pages/about'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get 'about', to: 'pages#about'

  resources :events, only: [:index, :show]
  resources :attendees, only: [:index, :show]
end
