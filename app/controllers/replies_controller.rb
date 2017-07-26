class RepliesController < ApplicationController

   def create
      @comment = Comment.find(params[:comment_id])
     @reply = @comment.replies.create(params[:reply].permit(:reply_body))
     @reply.user = current_user
     if @reply.save
       redirect_to(:back)
     else
       redirect_to :back
     end
   end

   def index
     @comments = Comment.find(params[:comment_id])
     @replies = @comments.replies
   end

   def destroy
     @reply = Reply.find(params[:id])
     if @reply.user_id == current_user.id || current_user.admin?
       @reply.delete
      redirect_to :back
    else
      redirect_to :back
    end
  end
end
