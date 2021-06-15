class User::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)

  end

   private
  def screen_user
    @user = User.find(params[:id])
   if current_user.id != @user.id
     redirect_to user_path(current_user)
   end
  end

  def user_params
      params.require(:user).permit(:name, :profile_image, :introduction,)
  end

end
