class ChildrenController < ApplicationController
  def index
    @chilren = Child.all
    @child = Child.new
  end
  
  def show
     @child = Childt.find(params[:id]) 
  end

  def new
    @child = Child.new
  end
    
  def create
    @child = Child.new
    post = Child.new(child_params)
    post.save
    # 後で投稿詳細に変更する↓
    redirect_to 'root'
  end
  
  def edit
    @child = Child.find(params[:id])
  end
  
  def update
    @child = Child.find(params[:id])
    if @child.update(child_params)
    flash[:notice] = "更新しました。"
    redirect_to child_path(@child.id)
    else
      render :edit
    end
  end
  
  private
  def child_params
    params.require(:child).permit(:name, :name_kana, :birthday, :gender, :personality, :image)
  end
end
