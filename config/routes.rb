Rails.application.routes.draw do
  resources :users

  post '/auth/login', to: 'authentication#login'
  delete '/auth/logout/', to: 'authentication#logout'
  
  
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :hotels do
        resources :reservations
      end
    end
  end

end
