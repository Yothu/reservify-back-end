Rails.application.routes.draw do
  resources :users

  post '/auth/login', to: 'authentication#login'
  delete '/auth/logout/', to: 'authentication#logout'
  
  
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      post '/hotelsbylocation', to: 'hotels#hotels_by_location'
      get '/countries', to: 'hotels#countries'
      post '/cities', to: 'hotels#cities_by_country'
      resources :hotels do
        resources :reservations
      end
    end
  end

end
