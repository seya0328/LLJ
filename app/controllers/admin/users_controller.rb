class Admin::UsersController < ApplicationController
  def index
    @users = Users.all
  end

  def show
    @users = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:last_name,:first_name,:gender,:address,:birthday,:email,:is_deleted)
  end
end
