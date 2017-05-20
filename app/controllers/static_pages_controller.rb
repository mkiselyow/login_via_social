class StaticPagesController < ApplicationController
  def index 
    if signed_in?
      @post  = current_user.posts.build
    else
      @feed_items = Post.all
    end
  end
end
