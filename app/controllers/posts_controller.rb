class PostsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def new
    @post = Post.new
    @child = Child.find(params[:id])
    
  end
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.child_id = params[:id]
    #@post.save
    if @post.save
      flash[:notice] = "投稿完了."
      redirect_to post_path(@post.id)
    else
      #byebug
      @posts = Post.all
      render :index
    end
    # 後で投稿詳細に変更する↓
    #redirect_to 'root'
  end
  def index
    @posts = Post.all
    @post = Post.new
  end
  
  def show
     @post = Post.find(params[:id]) 
     @child = @post.child
     @post_comment = PostComment.new
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
    flash[:notice] = "投稿更新完了"
    
    redirect_to post_path(@post.id) 
    else
    render "edit"
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    @user = @post.user
  end
  
  
  def destroy
    @post = Post.find(params[:post_id])
    @user = @post.user
    @post.destroy                      #postのidを渡して削除
    redirect_to user_child_path(params[:id]) #リダイレクトする際、childのidを指定してshowにとぶ
  end
  
  def satch
  end
  
  private
  def post_params
    params.require(:post).permit(:date, :title, :content, :user_id, :child_id, :image, :is_matching_login_user)
  end
  def is_matching_login_user
    post = Post.find(params[:id])
    user = post.user
    unless user.id == current_user.id
      redirect_to posts_path
    end
  end
end
