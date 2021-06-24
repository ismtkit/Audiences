class User::HomesController < ApplicationController
  def top
    @movieinfo_popular = JSON.parse((Tmdb::Movie.popular).to_json)
    @movieinfo_top_rated = JSON.parse((Tmdb::Movie.top_rated).to_json)
    @movieinfo_now_playing = JSON.parse((Tmdb::Movie.now_playing).to_json)
  end

end
