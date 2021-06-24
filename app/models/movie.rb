class Movie < ApplicationRecord

# いいね機能
belongs_to :user, optional: true
has_many :movie_reviews, dependent: :destroy


end
