class PostsController < ApplicationController

  def index
    @posts = Post.order("created_at DESC").includes(:user)
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
  
  private

  def post_params
    params.require(:post).permit(:title, :text, :genre_id, :price, :image).
                                  merge(user_id: current_user.id)
  end
end
