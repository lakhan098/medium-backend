class SignupController < ApplicationController
    skip_before_action :authenticate_request
    def signup
        render json: User.create(name: params[:name], description: params[:description], email: params[:email], password: params[:password])
    end
end
