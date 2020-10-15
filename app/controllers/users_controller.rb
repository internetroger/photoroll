class UsersController < ApplicationController
    before_action :authorized, only: [:show]
    
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @user.save
            redirect_to @user
        else  
            redirect :new
        end
    end

    def show
        # find_by does not raise ActiveRecord::RecordNotFound, defaults to nil
        @user = User.find_by(id: params[:id])
        if @user
            @public_posts = @user.posts.select {|p| !!p.is_private == false}
            @private_posts = @user.posts.select {|p| !!p.is_private == true}
        else
            render :file => 'public/404.html', :status => :not_found
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
