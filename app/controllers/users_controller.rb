class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
  end
end
