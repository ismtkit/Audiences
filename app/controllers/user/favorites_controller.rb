class User::FavoritesController < ApplicationController
  before_action :authenticate_user!  # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）

   # お気に入り登録
  def create
    @movie = Tmdb::Movie.detail(params[:movie_id])
    @favorite = current_user.favorites.new(api_id: @movie['id'])
    @favorite.save
    redirect_back(fallback_location: root_url)
  end

  # お気に入り削除
  def destroy
    @movie = Tmdb::Movie.detail(params[:movie_id])
    @favorite = current_user.favorites.find_by(api_id: @movie['id'])
    @favorite.destroy
    redirect_back(fallback_location: root_url)
  end
end
