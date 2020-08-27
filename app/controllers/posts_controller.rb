class PostsController < ApplicationController
    before_action :authorized, only: [:new, :create, :show]

    def index
        # need to use private flag
        @posts = Post.all
    end

    def create
        byebug
        @post = Post.create(post_params)
        @post.image.attach(post_params[:image])
        redirect_to @post.user
    end

    def show
        @post = Post.find(params[:id])
    end

    private

    def post_params
        params.require(:post).permit(:private, :image, :user_id)
    end
end
