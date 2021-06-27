class User::HomesController < ApplicationController
  def top
      @type = params[:movie].present? ? params[:movie][:type] : 'popular'
      if @type == 'popular'
        @movies = JSON.parse((Tmdb::Movie.popular).to_json)
      elsif @type == 'top_rated'
        @movies = JSON.parse((Tmdb::Movie.top_rated).to_json)
      elsif @type == 'now_playing'
        @movies = JSON.parse((Tmdb::Movie.now_playing).to_json)
      else
        @movies = JSON.parse((Tmdb::Movie.popular).to_json)
      end
  end

end
