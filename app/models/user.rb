class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ユーザープロフィール情報
  attachment :profile_image
  validates :name,  uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

 # フォローフォロワー機能
  has_many :follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :follows, source: :followed
  has_many :reverse_of_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_follows, source: :follower

  # お気に入り機能
  has_many :favorites, dependent: :destroy

  # 映画レビュー機能
  has_many :movie_reviews, dependent: :destroy



  def follow(user_id)
    follows.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follows.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

end
