class PagesController < ApplicationController
  def home
    @posts = Post.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
  end

  def help
  end
end
