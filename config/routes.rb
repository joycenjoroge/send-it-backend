Rails.application.routes.draw do
  get 'geocode/proxy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:create, :show, :update, :destroy]

  resources :admins, only: [] do
    member do
      patch 'change_status'
      patch 'change_location'
    end
  end

  resources :parcel_orders, only: [:index, :create] do
    member do
      patch 'change_destination'
      delete 'cancel'
    end
  end

  post '/login', to: 'sessions#create'
  get '/profile', to: 'sessions#profile'
  patch '/profile', to: 'sessions#update'

  post '/signup', to: 'registrations#create'
  delete '/logout', to: 'application#logout'

end
