class PostsController < ApplicationController
    before_action :authorized, only: [:new, :create]

    def index
        # need to use private flag
        @posts = Post.all.select {|post| !!post.is_private == false}
    end

    def create
        # add message to indicate failed upload
        @post = Post.new(post_params)
        if @post.save
            @post.image.attach(post_params[:image])
            redirect_to @post.user
        else
            flash[:error] = "Invalid file type! Supported extensions: jpeg, jpg, png"
            redirect_to current_user
        end
    end

    def destroy

    end

    private

    def post_params
        params.require(:post).permit(:is_private, :image, :user_id)
    end
end
