class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :set_user, only: [:likes]
  def new
    @user = User.new
  end
  def create
    @user = User.find(params[:id]) 
  end
  def show
     @user = User.find(params[:id]) 
     @posts = @user.posts.page(params[:page]).per(5)
     @chilren = Child.all
     @new_child = Child.new
     @childs = nil
     @tags = PostTag.all
    # @post = Post.all.post(created_at: :desc).limit(4)
     
  end
  
  def search
    @user = User.find(params[:id])
    if params[:keyword] 
      posts = @user.posts.search(params[:keyword])
    elsif params[:tag]
      #posts = @user.posts.joins(:tags)#.where('tags.name like ?' ,'%'+params[:tag]+'%')
      posts = @user.posts.tagged_with("#{params[:tag]}")
    else
      posts = @user.posts
    end
    @posts = posts.page(params[:page]).per(5)
    @chilren = Child.all
    @child = Child.new
    @child = Child.find(params[:id]) 
    @tags = PostTag.all
    render :show
  end
  
  def favorites
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
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
    params.require(:user).permit(:last_name, :first_name, :birthday, :gender,:post_id)
  end
  def set_user
    @user = User.find(params[:id])
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  
end
