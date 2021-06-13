class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :tmdb_api_setup

  private
  def tmdb_api_setup
    require 'themoviedb-api'
    Tmdb::Api.key("32e2d1724c11502fab17c3eaba398f75")
    Tmdb::Api.language("ja")
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
