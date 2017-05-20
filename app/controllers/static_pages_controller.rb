class StaticPagesController < ApplicationController
  def index 
    if signed_in?
      @post  = current_user.posts.build
      @feed_items = Post.all
    else
      @feed_items = Post.all
    end
  end
end
