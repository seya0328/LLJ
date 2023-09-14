class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def new
    @user = User.new
  end
  def create
    @user = User.find(params[:id]) 
  end
  def show
     @user = User.find(params[:id]) 
     @posts = Post.all
     @chilren = Child.all
     @child = Child.new
     @child = Child.find(params[:id]) 
     @tags = PostTag.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "更新しました。"
    redirect_to user_path(@user.id)
    else
      render :edit
    end
    
  end
  
  def check
  end
  
  def destroy
    user = User.find(params[:id])  
    user.destroy  
    redirect_to '/posts'  
  end
  
  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :birthday, :gender)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  
end
