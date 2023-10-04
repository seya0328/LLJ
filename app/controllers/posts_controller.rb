class PostsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def new
    @post = Post.new
    @child = Child.find(params[:id])
    # @tags = PostTag.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.child_id = params[:id]

    if @post.save
      # tag = Tag.find_or_create_by(name: params[:post][:tag])
      # PostTag.create!(tag: tag, post: @post)
      
      flash[:notice] = "投稿完了."
      redirect_to post_path(@post)
    else
      #byebug
      @posts = Post.all
      render :index
    end
    # redirect_to 'childen/:id/posts/:post_id'
  end

  def index
    #そのchildの投稿一覧を表示させたい
    # binding.pry
    @child = Child.find(params[:child_id])
    @posts = @child.posts.page(params[:page]).per(5)
    @post = Post.new
    # @posts = Post.all.page(params[:page]).per(5)
    
    
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
    params.require(:post).permit(:date, :title, :content, :user_id, :child_id, :image, :is_matching_login_user, :tag_list)
  end
  def is_matching_login_user
    post = Post.find(params[:id])
    user = post.user
    unless user.id == current_user.id
      redirect_to posts_path
    end
  end
end
