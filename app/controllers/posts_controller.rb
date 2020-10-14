class PostsController < ApplicationController
    before_action :authorized, only: [:new, :create]

    def index
        # need to use private flag
        @posts = Post.all.select {|post| !!post.is_private == false}
    end

    def create
        
        @post = Post.new(post_params)
        # do not allow empty uploads
        if @post.save and @post.image.attached?
            @post.image.attach(post_params[:image])
            redirect_to @post.user
        else
            # add message to indicate failed upload 
             post_params[:image] == nil ? flash[:error] = "Empty uploads are not allowed, please choose a valid file" : flash[:error] = "Invalid file type! Supported extensions: jpeg, jpg, png" 
            
            redirect_to current_user
        end
    end

    def destroy
        @post = Post.all.find {|p| p.id == params[:post_id]}
        if current_user.id == @post.user_id
            @post.destroy
            redirect_to current_user
        else
            flash[:error] = "Unauthorized action! Users can only delete their own posts."
            redirect_to current_user
        end

    end

    private

    def post_params
        params.require(:post).permit(:is_private, :image, :user_id)
    end
end
