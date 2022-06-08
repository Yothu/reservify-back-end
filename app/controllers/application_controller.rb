class ApplicationController < ActionController::API
  include JsonWebToken
  before_action :authenticate_request
  
    protected
  
    def authenticate_request
      header = request.headers["Authorization"]
      
      header = header.split(" ").last if header
      decoded = jwt_decode(header)
      @current_user = User.find(decoded[:user_id])
    end
end
