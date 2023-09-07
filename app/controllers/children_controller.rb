class ChildrenController < ApplicationController
  def index
    @chilren = Child.all
    @child = Child.new
    
  end
  
  def show
    @child = Child.find(params[:id]) 
  end

  def new
    @child = Child.new
  end
    
  def create
    @child = Child.new(child_params)
    @child.user_id = current_user.id
    @child.save!
    redirect_to user_child_path(current_user,@child)
  
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
    params.require(:child).permit(:name, :name_kana, :birthday, :gender, :personality, :profile_image)
  end
end
