class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :followers, through: :active_relationships,  source: :followed
  has_many :following, through: :passive_relationships, source: :follower
  
  has_many :user_likes, class_name:  "Like",
                                  foreign_key: "user_id",
                                  dependent:   :destroy
  has_many :like_posts, through: :user_likes,  source: :post
  
  validates :name, {format: {with: /\A[a-z0-9]+\z/},presence:true,uniqueness:true,length: {maximum: 30}}
  validates :password, {length: {minimum: 6, maximum: 30}}
  validates :tags, {length: {maximum: 100}}
  has_secure_password
  
  # 現在のユーザーがフォローしてたらtrueを返す
  def follower?(other_user)
    followers.include?(other_user)
  end
  
  def like?(post)
    like_posts.include?(post)
  end
end
