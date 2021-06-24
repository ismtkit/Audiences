class User::MoviesController < ApplicationController


  def search
  end

  def show
    @movie = Tmdb::Movie.detail(params[:id])
    @movie_review = MovieReview.new
    @director = Tmdb::Movie.director(params[:id])
    if @director == nil
      @director = "不明"
    end
    @cast = Tmdb::Movie.cast(params[:id])
  end

  private
  def movie_params
    params.require(:movie).permit(:api_id)
  end
end
