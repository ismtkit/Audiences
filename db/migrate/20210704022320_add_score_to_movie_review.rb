class AddScoreToMovieReview < ActiveRecord::Migration[5.2]
  def change
    add_column :movie_reviews, :score, :decimal, precision: 5, scale: 3
  end
end
