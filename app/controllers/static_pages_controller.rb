class StaticPagesController < ApplicationController
  def index 
    if signed_in?
      @post  = current_user.posts.build
      @feed_items = current_user.feed
    else
      @post  = Post.all
      @feed_items = Post.all
    end
  end
end
