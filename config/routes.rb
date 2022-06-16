Rails.application.routes.draw do
  resources :users

  post '/auth/login', to: 'authentication#login'
  delete '/auth/logout/', to: 'authentication#logout'
  
  
  
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      get 'latest', to: 'hotels#latest'
      post '/hotelsbylocation', to: 'hotels#hotels_by_location'
      get '/countries', to: 'hotels#countries'
      post '/cities', to: 'hotels#cities_by_country'
      resources :reservations
      resources :hotels 
      
    end
  end

end
