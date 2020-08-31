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
        @user = User.find(params[:id])
        @public_posts = @user.posts.select {|p| !!p.is_private == false}
        @private_posts = @user.posts.select {|p| !!p.is_private == true}
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
