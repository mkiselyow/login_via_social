class StaticPagesController < ApplicationController
  def index 
    if signed_in?
      @post  = current_user.posts.build
      @comment = current_user.comments.build # = Comment.new(:parent_id => params[:parent_id])
      # @comments = feed_item.comments.arrange(:order => :created_at) #.page(params[:page])
      # @comments = comments.find_by(post: post)
      @comments = Post.find(params[:post_id]).comments
      # @comments = Post.find(params[:parent_id]).comments
      # @comments = Post.find(params[:parent_id]).comments
      @feed_items = Post.all
      # @comments = feed_item.comments
      # @post = Post.new
      # @post.child_id = params[:child_id]
    else
      @feed_items = Post.all
      # @comments = feed_item.comments
      # @comments = comments.find_by(post: post)
      # @comments = Post.find(params[:parent_id]).comments
      @comments = Post.find(params[:post_id]).comments
      # @comments = Post.find(params[:parent_id]).comments
      # @comments = feed_item.comments.arrange(:order => :created_at) #.page(params[:page])
    end
  end
end
