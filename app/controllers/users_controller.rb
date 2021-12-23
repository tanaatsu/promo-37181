class UsersController < ApplicationController
   def show
     @user = User.find(params[:id])
     @users = User.all
     @posts = @user.posts
   end

   def destroy
     @user = User.find(params[:id])
     if @user.destroy
       redirect_to root_path
     else
      render :show
     end
   end
end
