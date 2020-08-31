class SessionsController < ApplicationController
  
    def create
      reset_session
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        session[:expires] = 2.days
        redirect_to @user
      else  
        redirect_to login_path
      end
    end

    def destroy
        # session[:user_id] = nil
        reset_session
        redirect_to login_path
    end
end
