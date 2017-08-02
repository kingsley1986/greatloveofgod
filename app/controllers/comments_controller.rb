class CommentsController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_action :find_comment_id, except: [:like, :create]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Successfully created a comment, we will review and approve your comment whithin 24 hours. Thank you #{@comment.user.first_name} "
      respond_to do |format|
        format.html { redirect_to @comment }
        format.js
      end
    else
      redirect_to :back
    end
  end


  def destroy
    if @comment.user_id == current_user.id || current_user.admin?
      @comment.destroy
      respond_to do |format|
        format.json { render json: @post }
      end
    else
      redirect_to :back
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(comment_params)
    if @comment.save
      @updated_comment = @comment.post_id
      @post = Post.find(@updated_comment)
      redirect_to @post
    end
  end

  def index
    @comment = Comment.all
  end

  def like
    @comment = Comment.find(params[:id])
    @comment.update_attributes(like: true)
    @comment.liker_id += [current_user.id]
    respond_to do |format|
      if @comment.save
        format.json { render json: @comment }
      end
    end
  end


  def unlike
    @comment = Comment.find(params[:id])
    @comment.update_attributes(like: false)
    @comment.liker_id -= [current_user.id]
    respond_to do |format|
      if @comment.save
        format.json { render json: @comment }
      end
    end
  end

  def find_comment_id
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :approved, pictures_attributes: [:id, :comment_id, :image])
  end
end
