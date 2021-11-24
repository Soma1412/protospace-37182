class PrototypesController < ApplicationController
  
  before_action :authenticate_user!, except: [:new, :edit, :delete] 
  before_action :move_to_edit, only: [:edit]

  def index
    @prototype = Prototype.all
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
       redirect_to root_path
    else
      render :new
    end
  end

  def new
    @prototype = Prototype.new
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update 
    @prototype = Prototype.find(params[:id])
  if@prototype.update(prototype_params) 
    redirect_to action: :show
    else
      render :new
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :image, :concept).merge(user_id: current_user.id)
  end

  def move_to_edit
    @prototype = Prototype.find(params[:id])
    unless current_user.id == @prototype.user.id 
      redirect_to action: :index
    end
  end
end
