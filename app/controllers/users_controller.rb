class UsersController < ApplicationController
   def show
     @user = User.find(params[:id])
     @users = User.all
     @posts = @user.posts
   end

   #def edit
     #@user = User.find(params[:id])
   #end

   #def update
     #@user = User.find(params[:id])
     #if @user.update(user_params)
     # redirect_to user_path(@user.id)
     #end
   #end

   #private

   #def user_params
     #params(:user).permit(:nickname,:email,:password,:last_name,:first_name,:telephone,:birthday,
                         # :industry_id,:reason_id,:person_id,:prefecture_id,:business_id,:store_name,:area,:opening_hours,:store_appeal,:image,:user_id)
   #end
end
