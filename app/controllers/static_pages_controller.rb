class StaticPagesController < ApplicationController
  def index 
    if signed_in?
      @post  = current_user.posts.build
      @posts = Post.arrange(:order => :created_at) #.page(params[:page])
    else
      @feed_items = Post.all
      @posts = Post.arrange(:order => :created_at) #.page(params[:page])
    end
  end
end
