class LoginController < ApplicationController
    skip_before_action :authenticate_request
   
    def login
      @user= User.find_by(email: params[:email])
      command = AuthenticateUser.call(params[:email], params[:password])
      if command && @user
        # redirect_to "/show_all_articles"
        render json: { auth_token: command.result }
      else
        # flash.now[:alert] = "Invalid email or password"
        render json: { error: command.errors }, status: :unauthorized
      end
    end
end
