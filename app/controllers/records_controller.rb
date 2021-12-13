class RecordsController < ApplicationController
  before_action :authenticate_user!, only:[:index]
  
  def index
    @post = Post.find(params[:post_id])
    @posts = Post.includes(:user)
    @record_address= RecordAddress.new
  end

  def new
    @post = Post.find(params[:post_id])
    @record_address = RecordAddress.new
  end

  def create
    @post = Post.find(params[:post_id])
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      @record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def record_params
    params.require(:record_address).permit(:postal_code,:prefecture_id,:municipality,:address,:building_name).merge(user_id: current_user.id, post_id: @post.id)
  end

end
