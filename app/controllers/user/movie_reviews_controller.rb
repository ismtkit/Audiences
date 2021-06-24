class User::MovieReviewsController < ApplicationController
  def create
    movie_review_param = params.require(:movie_review).permit(:review)
    product_comment_param = params.require(:product_comment).permit(:rate)
    @movie = Tmdb::Movie.detail(params[:movie_id])
    @review = current_user.movie_reviews.build()
    @review.rate = product_comment_param[:rate].to_f
    @review.review = movie_review_param[:review]
    @review.api_id = @movie.id
    @review.save!
    redirect_back(fallback_location: root_url)
  end

  def destroy
    @review = MovieReview.find(params[:id])
    @review.destroy
    redirect_back(fallback_location: root_url)
  end

  private
  def movie_review_params
    params.require(:movie_review).permit(:review, :rate)
  end

end
