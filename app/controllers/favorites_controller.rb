class FavoritesController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @child = @post.child
    @favorite = current_user.favorites.new(post_id: @post.id)
    @favorite.save
    redirect_to show_post_path(@child,@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @child = @post.child
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @favorite.save
    redirect_to show_post_path(@child,@post)
  end
  
end
