class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy

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
            flash[:warning] = "Post created Fail, please try fill all !"
            redirect_to request.referrer
        end
    end

    def show
        @post = Post.find(params[:id])
        @covers = @post.covers
    end

    def destroy
        @post.destroy
        flash[:success] = "Post deleted"
        redirect_to request.referrer || root_url
    end

    private
        def post_params
            params.require(:post).permit(:title, :content, covers_attributes: [ :id, :picture, :picture_cache, :_destroy ])
        end

        def correct_user
            @post = current_user.posts.find_by(id: params[:id])
            redirect_to root_url if @post.nil?
        end
end
