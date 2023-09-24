class UserController < ApplicationController
    skip_before_action :authenticate_request
    # before_action :authenticate_request
    def home
        render html: "hello world"
    end
    def show_user_by_user_email
       
        @user = User.where(id: @current_user.id)
        render json: @user
    end
   
end
