class PostsController < ApplicationController
    def index
        @posts = Post.order("created_at DESC")
    end

    def new
        @post = current_user.posts.new
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:success] = "Post created!"
            redirect_to root_url
        else
            flash[:warning] = "Post created Fail, please try again!"
        end
    end

    private
        def post_params
            params.require(:post).permit(:title, :content)
        end
end
