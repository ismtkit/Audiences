class MoviesController < ApplicationController
  require 'themoviedb-api'
  Tmdb::Api.key("32e2d1724c11502fab17c3eaba398f75")
  Tmdb::Api.language("ja")
  def search
  end

  def show
  end
end
