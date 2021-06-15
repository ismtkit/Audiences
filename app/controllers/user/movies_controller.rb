class User::MoviesController < ApplicationController

  def index
  end

  def search
  end

  def show
    @movie = Tmdb::Movie.detail(params[:id])  
  end

  private
  def movie_params
    params.require(:movie).permit(:api_id)
  end
end
