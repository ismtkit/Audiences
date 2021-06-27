class User::UsersController < ApplicationController
  before_action :screen_user, only: [:edit, :update]
  def index
    @users = User.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:api_id)
    @favorite_list = []
    favorites.each do |favorite|
       info = Tmdb::Movie.detail(favorite)
       @favorite_list.push(info)
    end
    @review = @user.movie_reviews.order("created_at DESC")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def search
    if params[:search_keyword].present?
      @users = User.where('name LIKE ?', "%#{params[:search_keyword]}%")
    else
      @users = User.none
    end
  end

   private

  def screen_user
    @user = User.find(params[:id])
    if user_signed_in?
     if current_user.id != @user.id
       redirect_to user_path(current_user)
     end
    else
      redirect_to root_path
    end
  end

  def user_params
      params.require(:user).permit(:name, :profile_image, :introduction,)
  end

end
