class Admin::MovieReviewsController < ApplicationController

  def index
   @movie_reviews = MovieReview.page(params[:page]).per(20)
  end

  def destroy
    @review = MovieReview.find(params[:id])
    @review.destroy
    redirect_back(fallback_location: root_url)
  end

end
