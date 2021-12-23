class PostsController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show]
  before_action :post_set,only:[:show,:edit,:update,:destroy]

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
    @comments = @post.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
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

  def post_set
    @post = Post.find(params[:id])
  end
end
