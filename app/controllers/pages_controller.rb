class PagesController < ApplicationController
  def home
    @posts = Post.all
  end

  def help
  end
end
