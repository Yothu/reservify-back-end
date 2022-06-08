Rails.application.routes.draw do
  resources :users

  post '/auth/login', to: 'authentication#login'

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :hotels
    end
  end

end
