class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user
    protect_from_forgery with: :exception
    
    def current_user
        if session[:user_id] and session[:expires_at] > Time.now
            @user = User.find(session[:user_id])
        else
            reset_session
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        redirect_to login_path unless logged_in?
    end
end
