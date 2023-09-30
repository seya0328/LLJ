class Admin::PostCommentsController < ApplicationController
  def index
    @post_comments = User.find(params[:user_id]).post_comments
  end
  
  def destroy
    comment = PostComment.find(params[:id])
    comment.destroy
    redirect_to admin_user_post_comments_path(params[:user_id])
  end
end
