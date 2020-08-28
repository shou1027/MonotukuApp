class Post < ApplicationRecord
  belongs_to :user
  has_many :post_likes, class_name:  "Like",
                                  foreign_key: "post_id",
                                  dependent:   :destroy
  has_many :like_users, through: :post_likes, source: :user
  #default_scope -> { order(created_at: :desc) }
  validates :title, {presence:true,length: {maximum: 100}}
  validates :image_name, {presence:true}
  validates :tags, {length: {maximum: 100}}
  validates :content, {length: {maximum: 10000}}
end
