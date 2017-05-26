class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @post = Post.find(params[:post_id])
    @comments = @post.comments.build(parent_id: params[:parent_id])
    # @comments = @post.comments.create(params[:comment], user_id: params[:user_id])
    @comments.user_id = current_user.id
    # @comments = Comment.new(:user_id => params[:user_id])
    # @comments.user = User.find(params[:user_id])
    @comments.save!

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    # @post = Post.find(params[:post_id])
    # @comments = @post.comments.create(params[:comment], user_id: params[:user_id])
    # @comments.user_id = current_user.id

    # respond_to do |format|
    #   if @comments.save
    #     format.html { redirect_to root_url, notice: 'Comment was successfully created.' }
    #     format.json { render json: @comment, status: :created, location: @comment }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @comment.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to root_url, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
end
