Rails.application.routes.draw do
  apipie
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/member-data', to: 'members#show'
  resources :hotels do
    resources :reservations
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "hotels#index"
end
