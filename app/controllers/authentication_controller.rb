class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
<<<<<<< HEAD
      render json: { token:, user: { role: @user.role, username: @user.username } }, status: :ok
=======
      render json: { token: token, user: { role: @user.role, username: @user.username } }, status: :ok
>>>>>>> development
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
  
end
