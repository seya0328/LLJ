class Admin::UsersController < ApplicationController
  def index
    @users = Users.all
  end

  def show
    @user = User.find(params[:id])
    #@post_comments = PostComment.all(current_user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:last_name,:first_name,:gender,:address,:birthday,:email,:is_deleted)
  end
end
