class PostsController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show]

  def index
    @posts = Post.order("created_at DESC").includes(:user)
    @users = User.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :text, :genre_id, :price, :image).
                                  merge(user_id: current_user.id)
  end
end
