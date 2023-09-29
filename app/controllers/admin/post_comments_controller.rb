class Admin::PostCommentsController < ApplicationController
  def index
    @post_comments = User.find(params[:user_id]).post_comments
  end
  
  def destroy
    comment = PostComment.find(params[:id])
    comment.destroy
    redirect_to :back
  end
end
