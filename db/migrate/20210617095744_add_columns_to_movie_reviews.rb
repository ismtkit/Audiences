class AddColumnsToMovieReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :movie_reviews, :user_id, :integer
    add_column :movie_reviews, :api_id, :integer
    add_column :movie_reviews, :rate, :float, default: 0
    add_column :movie_reviews, :review, :text
  end
end