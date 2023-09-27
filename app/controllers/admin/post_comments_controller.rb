class Admin::PostCommentsController < ApplicationController
  def show
    @comment = Post_comments.find(params[:id])
    @user = @comment.user
    @post_comments = @comment.all
  end
  
  def destroy
    comment = Post_comment.find(params[:id])
    comment.destroy
    redirect_to '/admin/post_comments/show'
  end
end
